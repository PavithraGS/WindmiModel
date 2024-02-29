ROOT_DIR = "data/"
GOES_40 = ls(ROOT_DIR + '*40kev*.txt');
GOES_40 = ROOT_DIR + GOES_40;
fid0 = fopen(GOES_40); 
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


fid0 = fopen(GOES_40);
GOES_40_data = [];    
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
        GOES_40_data = [GOES_40_data; num_data];
    end
    fclose(fid0);

GOES_75 = ls(ROOT_DIR + '* 75kev*.txt');
GOES_75 = ROOT_DIR + GOES_75;
fid0 = fopen(GOES_75); 
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


fid0 = fopen(GOES_75);
GOES_75_data = [];    
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
        GOES_75_data = [GOES_75_data; num_data];
    end
    fclose(fid0);
    
GOES_150 = ls(ROOT_DIR + '* 150kev*.txt');
GOES_150 = ROOT_DIR + GOES_150;
fid0 = fopen(GOES_150); 
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


fid0 = fopen(GOES_150);
GOES_150_data = [];    
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
        GOES_150_data = [GOES_150_data; num_data];
    end
    fclose(fid0);
    
        
GOES_275 = ls(ROOT_DIR + '* 275kev*.txt');
GOES_275 = ROOT_DIR + GOES_275;
fid0 = fopen(GOES_275); 
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


fid0 = fopen(GOES_275);
GOES_275_data = [];    
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
        GOES_275_data = [GOES_275_data; num_data];
    end
    fclose(fid0);
    
            
GOES_475 = ls(ROOT_DIR + '* 475kev*.txt');
GOES_475 = ROOT_DIR + GOES_475;
fid0 = fopen(GOES_475); 
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


fid0 = fopen(GOES_475);
GOES_475_data = [];    
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
        GOES_475_data = [GOES_475_data; num_data];
    end
    fclose(fid0);
    
    
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
    save GOES_40_data.mat GOES_40_data
    save GOES_75_data.mat GOES_75_data
    save GOES_150_data.mat GOES_150_data
    save GOES_275_data.mat GOES_275_data
    save GOES_475_data.mat GOES_475_data
