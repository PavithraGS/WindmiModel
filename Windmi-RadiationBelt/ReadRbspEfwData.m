ROOT_DIR = "data/";
RBSPA_EFW = ls(ROOT_DIR + 'RBSPA_EFW*.txt');
RBSPA_EFW = ROOT_DIR + RBSPA_EFW;
fid0 = fopen(RBSPA_EFW); 

count = 0;
strt_data = 0;
    while isequal(feof(fid0),0)
        data_line = fgetl(fid0);
        count = count+1;
        % If the line contains 'dd-mm-yyyy' Then the data starts on the
        % next line.
        if (isempty(data_line) == 0) & (size(data_line,2) >= 10)& (data_line(1:10) == 'dd-mm-yyyy')
                strt_data = count + 1;
        end
    end
    
    % data appears to end 3 lines before the end of the file. Could soft
    % code this later
    end_data = count - 3;
    
    dataSize = end_data - strt_data;
fclose(fid0);

fid0 = fopen(RBSPA_EFW);

% 5 is hard coded at the moment. This needs to be soft coded.
raw_efw_data = zeros(dataSize,5);
time_data = [];
% Read file buffer to the correct line
for q = 1:strt_data-1
        fgetl(fid0);
end
for q = 1:dataSize
        data_line = fgetl(fid0);
        %day = str2num(data_line(1:2));
        %tim_line = data_line(12:23);
        %tim_data = convert_time(tim_line);

        %Harded Coded Num_line should find the first space in the document
        %and take everything after
        [date,time,values] = extractDataFromLine(data_line);
        raw_efw_data(q ,:) = [time,values];
end
fclose(fid0);

clean_efw_data_zeros = raw_efw_data(:,2);
for index = 1 : length(clean_efw_data_zeros)
    if(abs(clean_efw_data_zeros(index)) > 20)
        clean_efw_data_zeros(index) = 0;
    end
end
time_line = raw_efw_data(:,1);
clean_efw_data_linear = filloutliers(raw_efw_data(:,2),"linear");
figure
subplot(7,1,1)
plot(raw_efw_data(:,2));

subplot(7,1,2)
plot(raw_efw_data(:,3));

subplot(7,1,3)
plot(raw_efw_data(:,4));

subplot(7,1,4)
plot(raw_efw_data(:,5));


subplot(7,1,5)
plot(x0,y0,x1,y1,x2,y2,x3,y3,x4,y4);
grid on;
axis tight;
ylabel('E Index')
xlim([0,lineSpace]);
subplot(7,1,6)
plot([1:length(AL_data)], AL_data(:,6), [1:length(AL_data)], SML_data(:,7), [1:length(y_sim)]/180, -y_sim/3500);

subplot(7,1,7)
plot([1:length(t_stamp)], Vsw0, [1:length(t_stamp)], VSW_delay);


figure
plot(clean_efw_data_linear);
figure
plot(clean_efw_data_zeros);

function [date,time,values] = extractDataFromLine(line)
    character_arr = line;
    s = size(character_arr);
    date = "";
    time = "";
    value = "";
    values = [];
    state = -1;
    for index = 1:s(2)
        switch(true)
            case strcmp(character_arr(index)," ") == 0
                if(state == -1 || state == 0)
                    state = 0;
                    date = append(date,character_arr(index)); 
                end
                if(state == 1 || state == 2)
                    state = 2;
                    time = append(time,character_arr(index)); 
                end
                if(state == 3 || state == 4 || state == 5)
                    state = 4;
                    value = append(value,character_arr(index)); 
                end
            otherwise 
                if (state == 0)
                    state = 1;
                end
                if (state == 2)
                    state = 3;
                end
                if (state == 4)
                    state = 5;
                    values = [values, str2double(value)];
                    value = "";
                end
        end
    end
    values = [values,str2double(value)];
    %time
%     date_time = "";
%     date_time = append(date,' ');
%     date_time = append(date_time, time);
%     date_time = datetime(date_time,'InputFormat','dd-MM-yyy hh:mm:ss.SSS');
    time = duration(time,'InputFormat','hh:mm:ss.SSS');
    time = minutes(time);
    %time = minutes(date_time);
end



    
