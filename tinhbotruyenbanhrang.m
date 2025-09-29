% ==================================================================
% BÀI TẬP LỚN CHI TIẾT MÁY - BỘ TRUYỀN BÁNH RĂNG
% MÔN: CHI TIẾT MÁY
% ==================================================================
% Đề: 1/VTL.1.1.25.BTL.L21
% Sinh viên: Lưu Quang Vũ - 23011608
% Lớp: K17-KTCDT_2
% =================================================================

clear all; clc; close all;
fprintf('BÀI TẬP LỚN CHI TIẾT MÁY - BỘ TRUYỀN BÁNH RĂNG\n');
fprintf('MÔN: CHI TIẾT MÁY\n');
fprintf('Đề: 1/VTL.1.1.25.BTL.L21\n');
fprintf('Sinh viên: Lưu Quang Vũ - 23011608\n');
fprintf('Lớp: K17-KTCDT_2\n');
fprintf('=========================================\n\n');

%% DỮ LIỆU ĐẦU VÀO (từ đề bài)
fprintf('DỮ LIỆU ĐẦU VÀO (từ đề bài):\n');

% Thông số từ bảng
P1 = 0.846; % kW - Công suất trên trục chủ động
n1 = 580; % vòng/phút - Số vong quay trên trục chủ động
T1 = 13929.8; % N.mm - Moment xoắn của trục chủ động
u = 4.5; % Tỉ số truyền của bộ truyền
beta = 20; % độ - Góc nghiêng của bộ truyền so với phương ngang
so_ca = 3 ; % Bộ truyền làm việc
time = 13000; % giờ - Thời gian làm việc của bộ truyền
loai_tai =  1 ; % Tải trọng tĩnh, làm việc êm
fprintf('- Công suất trên trục chủ động P1 = %.3f kW\n', P1);
fprintf('- Số vong quay trên trục chủ động n1 = %d vòng/phút\n', n1);
fprintf('- Moment xoắn của trục chủ động T1 = %.1f N.mm\n', T1);
fprintf('- Tỉ số truyền của bộ truyền u = %.1f\n', u);
fprintf('- Góc nghiêng của bộ truyền so với phương ngang beta = %d độ\n', beta);
fprintf('- Bộ truyền làm việc với số ca = %d ca\n', so_ca);
fprintf('- Thời gian làm việc của bộ truyền time = %d giờ\n', time);
fprintf('- Loại tải: %d (1 - Tải trọng tĩnh, làm việc êm; 2 - Dao động nhẹ; 3 - Dao động manh; 4 - Va đập rất mạnh)\n', loai_tai);

%% 2.1: Chọn vật liệu
fprintf('\n2.1: Chọn vật liệu\n');
fprintf('Chọn vật liệu làm bánh răng:\n');

% Vật liệu bánh răng nhỏ
fprintf('- Vật liệu bánh răng nhỏ:\n');
nhan_hieu_thep_nho = 45;
che_do_nhiet_luyen_nho = 'Thường hóa';
HB1 = 190; % Độ rắn ( Số vòng càng cao thì độ rắn càng lớn)
sigma_b1 = 600; % Giới hạn bền (MPa)
sigma_h1 = 340; % Giới hạn chảy (MPa)
fprintf('  Nhãn hiệu thép: %d\n', nhan_hieu_thep_nho);
fprintf('  Chế độ nhiệt luyện: %s\n', che_do_nhiet_luyen_nho);
fprintf('  Độ rắn: HB1 = %d\n', HB1);
fprintf('  Giới hạn bền sigma_b1 = %d MPa\n', sigma_b1);
fprintf('  Giới hạn chảy sigma_h1 = %d MPa\n', sigma_h1);

% Vật liệu bánh răng lớn
fprintf('- Vật liệu bánh răng lớn:\n');
nhan_hieu_thep_lon = 45;
che_do_nhiet_luyen_lon = 'Thường hóa';
HB2 = 180; % Độ rắn ( Số vòng càng cao thì độ rắn càng lớn)
sigma_b2 = 600; % Giới hạn bền (MPa)
sigma_h2 = 340; % Giới hạn chảy (MPa)
fprintf('  Nhãn hiệu thép: %d\n', nhan_hieu_thep_lon);
fprintf('  Chế độ nhiệt luyện: %s\n', che_do_nhiet_luyen_lon);
fprintf('  Độ rắn: HB2 = %d\n', HB2);
fprintf('  Giới hạn bền sigma_b2 = %d MPa\n', sigma_b2);
fprintf('  Giới hạn chảy sigma_h2 = %d MPa\n', sigma_h2);

%% 2.2: Xác định ứng suất cho phép
fprintf('\n2.2: Xác định ứng suất cho phép\n');

% + S_H, S_F: Hệ số an toàn khi tính về ứng suất tiếp xúc và ứng suất uốn.
% + sigma_Hlim, sigma_Flim: Ứng suất tiếp xúc và ứng suất uốn cho phép ứng với số cơ sở.

%% Xác định hệ số an toàn và ứng suất tiếp xúc, ứng suất uốn
fprintf('Xác định hệ số an toàn và ứng suất tiếp xúc, ứng suất uốn:\n');
% Tra bảng 6.2 ta được:
S_H1 = 1.1 ; S_F1 = 1.75;
S_H2 = 1.1 ; S_F2 = 1.75;

fprintf('- Hệ số an toàn khi tính về ứng suất tiếp xúc và ứng suất uốn:\n');
fprintf('  S_H1 = %.2f\n', S_H1);
fprintf('  S_F1 = %.2f\n', S_F1);
fprintf('  S_H2 = %.2f\n', S_H2);
fprintf('  S_F2 = %.2f\n', S_F2);

%% Ứng suất tiếp xúc cho phép với chu ky cơ sở của bánh chủ động và bánh bị động
sigma_Hlim1 = 2*HB1 + 70; % Bánh chủ động
sigma_Hlim2 = 2*HB2 + 70; % Bánh bị động

%% Ứng suất uốn cho phép với chu kỳ cơ sở của bánh chủ động và bánh bị động
sigma_Flim1 = 1.8*HB1;  % Bánh chủ động
sigma_Flim2 = 1.8*HB2;  % Bánh bị động

fprintf('- Ứng suất tiếp xúc cho phép:\n');
fprintf('  sigma_Hlim1 = %.0f MPa\n', sigma_Hlim1);
fprintf('  sigma_Hlim2 = %.0f MPa\n', sigma_Hlim2);
fprintf('- Ứng suất uốn cho phép:\n');
fprintf('  sigma_Flim1 = %.0f MPa\n', sigma_Flim1);
fprintf('  sigma_Flim2 = %.0f MPa\n', sigma_Flim2);

%% Tính toán sơ bộ N_HO, N_HE, N_FE, N_FO
fprintf('\nTính toán sơ bộ N_HO, N_HE, N_FE, N_FO:\n');
m_f = 6; % bậc của đường cong mỏi tra bảng 6.4 [1] ** Giá trị thay đổi theo bảng trường hợp nên phải tra bảng  6.4 **
m_h = 6; % bậc của đường cong mỏi tra bảng 6.4 [1] ** Giá trị thay đổi theo bảng trường hợp nên phải tra bảng  6.4 **
%% Số chu kỳ thay đổi ứng suất tiếp xúc cơ sở bánh chủ động
N_HO1 = 30 * HB1^2.4;
%% Số chu kỳ thay đổi ứng suất tiếp xúc cơ sở bánh bị động
N_HO2 = 30 * HB2^2.4;
%% In giá trị
N_HO1_exp = floor(log10(N_HO1));
N_HO1_base = N_HO1 / 10^N_HO1_exp;
fprintf('  N_HO1 = 30*%.0f^2.4 = %.2f * 10^%d\n', HB1, N_HO1_base, N_HO1_exp);
N_HO2_exp = floor(log10(N_HO2));
N_HO2_base = N_HO2 / 10^N_HO2_exp;
fprintf('  N_HO2 = 30*%.0f^2.4 = %.2f * 10^%d\n', HB2, N_HO2_base, N_HO2_exp);

%% Số chu kỳ thay đổi ứng suất tương đương của bánh chủ động
c = 1; % Số lần khớp trong một vòng quay
N_HE1 = n1 * 60 * time * c; % Bánh chủ động
N_FE1 = N_HE1; % Bánh chủ động
N_HE1_exp = floor(log10(N_HE1));
N_HE1_base = N_HE1 / 10^N_HE1_exp; % Đổi về hệ số mũ
%% Số chu kỳ thay đổi ứng suất tương đương của bánh bị động
N_HE2 = N_HE1 / u; % Bánh bị động
N_FE2 = N_HE2; % Bánh bị động
N_HE2_exp = floor(log10(N_HE2));
N_HE2_base = N_HE2 / 10^N_HE2_exp; % Đổi về hệ số mũ
%% In giá trị
fprintf('  N_HE1 = n1 * 60 * time * c = %d * 60 * %d * %d = %.2f * 10^%d\n', n1, time, c, N_HE1_base, N_HE1_exp);
N_FE1_exp = floor(log10(N_FE1));
N_FE1_base = N_FE1 / 10^N_FE1_exp;
fprintf('  N_FE1 = N_HE1 = %.2f * 10^%d\n', N_FE1_base, N_FE1_exp);
fprintf('  N_HE2 = N_HE1 / u = %.2f * 10^%d / %.1f = %.2f * 10^%d\n', N_HE1_base, N_HE1_exp, u, N_HE2_base, N_HE2_exp);
N_FE2_exp = floor(log10(N_FE2));
N_FE2_base = N_FE2 / 10^N_FE2_exp;
fprintf('  N_HE2 = N_FE2 = %.2f * 10^%d\n', N_FE2_base, N_FE2_exp);
%% Số chu kỳ thay đổi ứng suất uốn cơ sở bánh chủ động và bánh bị động
N_FO1 = 4 * 10^6;
N_FO2 = N_FO1;
N_FO1_exp = floor(log10(N_FO1));
N_FO1_base = N_FO1 / 10^N_FO1_exp;
fprintf('  N_FO1 = N_FO2 = %.2f * 10^%d\n', N_FO1_base, N_FO1_exp);

%% Xác định hệ số tuổi thọ
fprintf('\nXác định hệ số tuổi thọ:\n');


%% Hệ số tuổi thọ xét đến ảnh hưởng của thời hạn phục vụ K_HL

if N_HE1 < N_HO1
    K_HL1 = (N_HO1 / N_HE1)^(1/m_h);
else
    K_HL1 = 1;
end
if N_HE2 < N_HO2
    K_HL2 = (N_HO2 / N_HE2)^(1/m_h);
else
    K_HL2 = 1;
end
fprintf('  K_HL1 (bánh chủ động) = %.3f\n', K_HL1);
fprintf('  K_HL2 (bánh bị động) = %.3f\n', K_HL2);

%% Hệ số tuổi thọ xét đến ảnh hưởng của thời hạn phục vụ K_FL


if N_FE1 < N_FO1
    K_FL1 = (N_FO1 / N_FE1)^(1/m_f);
else
    K_FL1 = 1;
end
if N_FE2 < N_FO2
    K_FL2 = (N_FO2 / N_FE2)^(1/m_f);
else
    K_FL2 = 1;
end
fprintf('  K_FL1 (bánh chủ động) = %.3f\n', K_FL1);
fprintf('  K_FL2 (bánh bị động) = %.3f\n', K_FL2);