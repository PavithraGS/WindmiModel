% Read in proton density, solar wind velocity and ACE satellite position
% Returns one array S_Wind with day, time, N_p, Vx, Vy, Vz, X, Y, Z
% There is spoilt data, to be corrected by processing later
ROOT_DIR = "../data/";
AC_HO_MFI_FILE = ls(ROOT_DIR+'*MFI*.txt');
AC_HO_MFI_FILE = ROOT_DIR + AC_HO_MFI_FILE; 
fid0 = fopen(AC_HO_MFI_FILE);
count = 0;
strt_data = 0;
    while isequal(feof(fid0),0);
        data_line = fgetl(fid0);
        count = count+1;
        if (isempty(data_line) == 0) && (size(data_line,2) >= 10) && strcmp(data_line(1:10),'dd-mm-yyyy')
                strt_data = count + 1;
        end
    end
    end_data = count - 3;
fclose(fid0);

fid0 = fopen(AC_HO_MFI_FILE);
B_Field = [];    
    for q = 1:strt_data-1;
        fgetl(fid0);
    end
    for q = strt_data:end_data
        data_line = fgetl(fid0);
        day = str2num(data_line(1:2));
        tim_line = data_line(12:23);
        tim_data = convert_time(tim_line);
        num_line = data_line(24:size(data_line,2));
        num_scan = sscanf(num_line,'%e');
        num_data = [day tim_data num_scan'];
        B_Field = [B_Field; num_data];
    end
    fclose(fid0);

    save MFI.mat B_Field;
    clear;
