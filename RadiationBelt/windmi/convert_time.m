% Convert hh:mm:ss:ms to seconds with 1 second accuracy.
function t = convert_time(time_str) 

time_hr = str2num(time_str(1:2));
time_min = str2num(time_str(4:5));
time_sec = str2num(time_str(7:8));
t = time_hr*3600 + time_min*60 + time_sec;