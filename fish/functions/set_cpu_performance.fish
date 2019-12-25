# Sets CPU scaling governor to performance mode.
function set_cpu_performance
  echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
end
