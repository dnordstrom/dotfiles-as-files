# Sets CPU scaling governor to schedutil mode (balanced).
function set_cpu_schedutil
  echo schedutil | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
end
