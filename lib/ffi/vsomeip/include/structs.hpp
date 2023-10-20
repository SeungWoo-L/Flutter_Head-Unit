#pragma once
#ifndef __STRUCTS_HPP__
# define _STRUCTS_HPP__

# include <stdint.h>
# include <string>

typedef struct Info
{
    uint32_t    battery_level;
    double      voltage;
    double      current;
    double      power_consumption;
} Info;

typedef struct Provider
{
    uint32_t    speed;
    uint32_t    rpm;
    std::string gear;
    std::string indicator;
    uint32_t    battery_level;
    double      voltage;
    double      current;
    double      power_consumption;
} Provider;

#endif