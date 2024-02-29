ROOT_DIR = "data/"
    
RBSPA_FILE_NAME = ls(ROOT_DIR + 'RBSPA_REL*.txt')
RBSPA_FILE_NAME = ROOT_DIR + RBSPA_FILE_NAME 
fid0 = fopen(RBSPA_FILE_NAME)
count = 0;
strt_data = 0;
    while isequal(feof(fid0),0);
        data_line = fgetl(fid0);
        count = count+1;
        if (isempty(data_line) == 0) & (size(data_line,2) >= 10)& (data_line(1:10) == 'dd-mm-yyyy')
                strt_data = count + 1;
        end
    end
    end_data = count - 3;
fclose(fid0);


fid0 = fopen(RBSPA_FILE_NAME)
Flux_data = [];    
    for q = 1:strt_data-1;
        fgetl(fid0);
    end
    for q = strt_data:end_data
        data_line = fgetl(fid0);
        %day = str2num(data_line(1:2));
        %tim_line = data_line(12:23);
        %tim_data = convert_time(tim_line);

        %Harded Coded Num_line should find the first space in the document
        %and take everything after
        num_line = data_line(28:size(data_line,2));
        num_scan = sscanf(num_line,'%e');
        num_data = [num_scan'];
        Flux_data = [Flux_data; num_data];
    end
    fclose(fid0);
    
% fid0 = fopen('RBSPA_REL04_ECT-MAGEIS-L3_54574.txt'); 
% count = 0;
% strt_data = 0;
%     while isequal(feof(fid0),0);
%         data_line = fgetl(fid0);
%         count = count+1;
%         if (isempty(data_line) == 0) & (size(data_line,2) >= 10)& (data_line(1:10) == 'dd-mm-yyyy')
%                 strt_data = count + 1;
%         end
%     end
%     end_data = count - 3;
% fclose(fid0);
% 
% fid0 = fopen('RBSPA_REL04_ECT-MAGEIS-L3_54574.txt');
% Flux_data4 = [];    
%     for q = 1:strt_data-1;
%         fgetl(fid0);
%     end
%     for q = strt_data:end_data
%         data_line = fgetl(fid0);
%         %day = str2num(data_line(1:2));
%         %tim_line = data_line(12:23);
%         %tim_data = convert_time(tim_line);
% 
%         %Harded Coded Num_line should find the first space in the document
%         %and take everything after
%         num_line = data_line(28:size(data_line,2));
%         num_scan = sscanf(num_line,'%e');
%         num_data = [num_scan'];
%         Flux_data4 = [Flux_data4; num_data];
%     end
%     fclose(fid0);
%     
    
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
   % Consider putting this in it's on folder as well %
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    save Flux.mat Flux_data

