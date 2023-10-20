#define EXPORT extern "C" __attribute__((visibility("default"))) __attribute__((used))

#include <vsomeip/vsomeip.hpp>
#include <csignal>
#include <chrono>
#include <thread>
#include <mutex>
#include <iostream>
#include <iomanip>
#include <sstream>
#include <cstring>

#include "defines.hpp"
#include "structs.hpp"

static std::shared_ptr<vsomeip::application> app;
static std::set<vsomeip::eventgroup_t> sensor_eventgroup({SPEEDSENSOR_EVENTGROUP_ID});
static std::set<vsomeip::eventgroup_t> gear_eventgroup({GEAR_EVENTGROUP_ID});
static std::set<vsomeip::eventgroup_t> indicator_eventgroup({INDICATOR_EVENTGROUP_ID});
static std::set<vsomeip::eventgroup_t> info_eventgroup({INFO_EVENTGROUP_ID});
static std::set<vsomeip::eventgroup_t> hu_gear_eventgroup({HU_GEAR_EVENTGROUP_ID});

static char gear_;

void on_state(vsomeip::state_type_e _state)
{
    if (_state == vsomeip::state_type_e::ST_REGISTERED) {
        std::cout << "Application is registered!" << std::endl;
	} else if (_state == vsomeip::state_type_e::ST_DEREGISTERED) {
        std::cout << "Application is deregistered!" << std::endl;
	}
}

void on_availability(vsomeip::service_t _service, vsomeip::instance_t _instance, bool _is_available)
{
    std::cout << "Service availablity changed ["
              << std::setfill('0') << std::hex
              << std::setw(4) << _service << "."
              << std::setw(4) << _instance
              << "] = is ";
              if (!_is_available)
                std::cout << "not ";
              std::cout << "available" << std::endl;
    
    if (_service == MODERATOR_SERVICE_ID && \
        _instance == MODERATOR_INSTANCE_ID)
    {
        if (_is_available)
        {
            app->subscribe(MODERATOR_SERVICE_ID, MODERATOR_INSTANCE_ID, SPEEDSENSOR_EVENTGROUP_ID);
            app->subscribe(MODERATOR_SERVICE_ID, MODERATOR_INSTANCE_ID, GEAR_EVENTGROUP_ID);
            app->subscribe(MODERATOR_SERVICE_ID, MODERATOR_INSTANCE_ID, INDICATOR_EVENTGROUP_ID);
            app->subscribe(MODERATOR_SERVICE_ID, MODERATOR_INSTANCE_ID, INFO_EVENTGROUP_ID);
        }
        else {
            app->request_service(MODERATOR_SERVICE_ID, MODERATOR_INSTANCE_ID);
            app->unsubscribe(MODERATOR_SERVICE_ID, MODERATOR_INSTANCE_ID, SPEEDSENSOR_EVENTGROUP_ID);
            app->unsubscribe(MODERATOR_SERVICE_ID, MODERATOR_INSTANCE_ID, GEAR_EVENTGROUP_ID);
            app->unsubscribe(MODERATOR_SERVICE_ID, MODERATOR_INSTANCE_ID, INDICATOR_EVENTGROUP_ID);
            app->unsubscribe(MODERATOR_SERVICE_ID, MODERATOR_INSTANCE_ID, INFO_EVENTGROUP_ID);
        }
    }
}

void on_message(const std::shared_ptr<vsomeip::message> &_message)
{
    vsomeip::service_t  _service    = _message->get_service();
    vsomeip::instance_t _instance   = _message->get_instance();
    vsomeip::event_t    _event      = _message->get_method();
    vsomeip::client_t   _client     = _message->get_client();
    vsomeip::session_t  _session    = _message->get_session();

    std::stringstream its_message;
    its_message << "Received a Event ["
                << std::setfill('0') << std::hex
                << std::setw(4) << _service << "."
                << std::setw(4) << _instance << "."
                << std::setw(4) << _event << "] to Client/Session ["
                << std::setw(4) << _client << "/"
                << std::setw(4) << _session
                << "] = " << std::dec;

    std::shared_ptr<vsomeip::payload> its_payload = _message->get_payload();

    switch (_event)
    {
    case SPEED_EVENT_ID:
    {
        uint32_t its_data = *(reinterpret_cast<uint32_t*>(its_payload->get_data()));
        std::cout << "Speed: " << its_data << std::endl;
    }
        break;
    case RPM_EVENT_ID:
    {
        uint32_t its_data = *(reinterpret_cast<uint32_t*>(its_payload->get_data()));
        std::cout << "RPM: " << its_data << std::endl;
    }
        break;
    case GEAR_EVENT_ID:
    {
        char *str = reinterpret_cast<char*>(its_payload->get_data());
        std::cout << "(from Control)Gear: " << str << std::endl;
        gear_ = *str;
    }
        break;
    case INDICATOR_EVENT_ID:
    {
        char *str = reinterpret_cast<char*>(its_payload->get_data());
        std::cout << "(from Control)Indicator: " << str << std::endl;
    }
        break;
    case INFO_EVENT_ID:
    {
        Info info = *(reinterpret_cast<Info*>(its_payload->get_data()));
        std::cout << "bat: " << info.battery_level << ", "
                  << "V: " << info.voltage << ", "
                  << "A: " << info.current << ", "
                  << "P: " << info.power_consumption << std::endl;
    }
        break;
    default:
        break;
    }
}

void notify(void)
{
    std::shared_ptr<vsomeip::payload> gear_payload = vsomeip::runtime::get()->create_payload();
    vsomeip::length_t buf_size = 2;
    vsomeip::byte_t buffer[buf_size];

   for (size_t i=0; i<buf_size; i++)
      buffer[i] = 0;
   memcpy(buffer, &gear_, 1);
   gear_payload->set_data(buffer, 2);
   app->notify(HU_SERVICE_ID, HU_INSTANCE_ID, HU_GEAR_EVENT_ID, gear_payload);
}

void start_app(void)
{
    app->start();
}

void stop(int signum)
{
    app->clear_all_handler();
    app->unsubscribe(MODERATOR_SERVICE_ID, MODERATOR_INSTANCE_ID, SPEEDSENSOR_EVENTGROUP_ID);
    app->unsubscribe(MODERATOR_SERVICE_ID, MODERATOR_INSTANCE_ID, GEAR_EVENTGROUP_ID);
    app->unsubscribe(MODERATOR_SERVICE_ID, MODERATOR_INSTANCE_ID, INDICATOR_EVENTGROUP_ID);
    app->unsubscribe(MODERATOR_SERVICE_ID, MODERATOR_INSTANCE_ID, INFO_EVENTGROUP_ID);
    app->release_service(IC_SERVICE_ID, IC_INSTANCE_ID);
    app->stop();
}

EXPORT
bool init(void)
{
    signal(SIGINT, stop);
    signal(SIGQUIT, stop);

    app = vsomeip::runtime::get()->create_application("speed_sensor");
    if (!app->init())
        return false;
    app->register_state_handler(on_state);
    app->register_availability_handler(MODERATOR_SERVICE_ID, MODERATOR_INSTANCE_ID, on_availability);
    app->register_message_handler(MODERATOR_SERVICE_ID, MODERATOR_INSTANCE_ID, vsomeip::ANY_EVENT, on_message);

    app->offer_service(HU_SERVICE_ID, HU_INSTANCE_ID);

    app->request_event(MODERATOR_SERVICE_ID, MODERATOR_INSTANCE_ID, SPEED_EVENT_ID, sensor_eventgroup, vsomeip::event_type_e::ET_FIELD, vsomeip::reliability_type_e::RT_RELIABLE);
    app->request_event(MODERATOR_SERVICE_ID, MODERATOR_INSTANCE_ID, RPM_EVENT_ID, sensor_eventgroup, vsomeip::event_type_e::ET_FIELD, vsomeip::reliability_type_e::RT_RELIABLE);    
    app->request_event(MODERATOR_SERVICE_ID, MODERATOR_INSTANCE_ID, GEAR_EVENT_ID, gear_eventgroup, vsomeip::event_type_e::ET_FIELD, vsomeip::reliability_type_e::RT_RELIABLE);
    app->request_event(MODERATOR_SERVICE_ID, MODERATOR_INSTANCE_ID, INDICATOR_EVENT_ID, indicator_eventgroup, vsomeip::event_type_e::ET_FIELD, vsomeip::reliability_type_e::RT_RELIABLE);
    app->request_event(MODERATOR_SERVICE_ID, MODERATOR_INSTANCE_ID, INFO_EVENT_ID, info_eventgroup, vsomeip::event_type_e::ET_FIELD, vsomeip::reliability_type_e::RT_RELIABLE);

    app->offer_event(HU_SERVICE_ID, HU_INSTANCE_ID, HU_GEAR_EVENT_ID, hu_gear_eventgroup, vsomeip::event_type_e::ET_FIELD, std::chrono::duration<int64_t, std::milli>::zero(), false, true, nullptr, vsomeip::reliability_type_e::RT_RELIABLE);

    //  std::thread notifier(notify);
    //  notifier.detach();

    // app->start();
    return true;
}

EXPORT
void start(void)
{
    std::thread app_thread(start_app);
    app_thread.detach();
}

EXPORT
int getGear(void)
{
   return gear_;
}

EXPORT
void setGear(int gear)
{
   gear_ = gear % 256;
   notify();
}
