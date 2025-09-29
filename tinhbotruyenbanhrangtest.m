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
P1 = 0.658; % kW - Công suất trên trục chủ động
n1 = 360; % vòng/phút - Số vong quay trên trục chủ động
T1 = 17455.3; % N.mm - Moment xoắn của trục chủ động
u = 4.5; % Tỉ số truyền của bộ truyền
beta_debaicho = 35; % độ - Góc nghiêng của bộ truyền so với phương ngang
so_ca = 3 ; % Bộ truyền làm việc
time = 18000; % giờ - Thời gian làm việc của bộ truyền
loai_tai =  1 ; % Tải trọng tĩnh, làm việc êm
fprintf('- Công suất trên trục chủ động P1 = %.3f kW\n', P1);
fprintf('- Số vong quay trên trục chủ động n1 = %d vòng/phút\n', n1);
fprintf('- Moment xoắn của trục chủ động T1 = %.1f N.mm\n', T1);
fprintf('- Tỉ số truyền của bộ truyền u = %.1f\n', u);
fprintf('- Góc nghiêng của bộ truyền so với phương ngang beta = %d độ\n', beta_debaicho);
fprintf('- Bộ truyền làm việc với số ca = %d ca\n', so_ca);
fprintf('- Thời gian làm việc của bộ truyền time = %d giờ\n', time);
fprintf('- Loại tải: %d (1 - Tải trọng tĩnh, làm việc êm; 2 - Dao động nhẹ; 3 - Dao động manh; 4 - Va đập rất mạnh)\n', loai_tai);

%% 2.1: Chọn vật liệu
fprintf('\n2.1: Chọn vật liệu\n');
fprintf('Chọn vật liệu làm bánh răng:\n');

% Vật liệu bánh răng nhỏ
fprintf('- Vật liệu bánh răng nhỏ:\n');
nhan_hieu_thep_nho = 45;
che_do_nhiet_luyen_nho = 'Tôi cải thiện';
HB1 = 240; % Độ rắn ( Số vòng càng cao thì độ rắn càng lớn)
sigma_b1 = 750; % Giới hạn bền (MPa)
sigma_h1 = 450; % Giới hạn chảy (MPa)
fprintf('  Nhãn hiệu thép: %d\n', nhan_hieu_thep_nho);
fprintf('  Chế độ nhiệt luyện: %s\n', che_do_nhiet_luyen_nho);
fprintf('  Độ rắn: HB1 = %d\n', HB1);
fprintf('  Giới hạn bền sigma_b1 = %d MPa\n', sigma_b1);
fprintf('  Giới hạn chảy sigma_h1 = %d MPa\n', sigma_h1);

% Vật liệu bánh răng lớn
fprintf('- Vật liệu bánh răng lớn:\n');
nhan_hieu_thep_lon = 45;
che_do_nhiet_luyen_lon = 'Thường hóa';
HB2 = 230; % Độ rắn ( Số vòng càng cao thì độ rắn càng lớn)
sigma_b2 = 750; % Giới hạn bền (MPa)
sigma_h2 = 450; % Giới hạn chảy (MPa)
fprintf('  Nhãn hiệu thép: %d\n', nhan_hieu_thep_lon);
fprintf('  Chế độ nhiệt luyện: %s\n', che_do_nhiet_luyen_lon);
fprintf('  Độ rắn: HB2 = %d\n', HB2);
fprintf('  Giới hạn bền sigma_b2 = %d MPa\n', sigma_b2);
fprintf('  Giới hạn chảy sigma_h2 = %d MPa\n', sigma_h2);

%% 2.2: Xác định sơ bộ  ứng suất cho phép
fprintf('\n2.2: Xác định sơ bộ ứng suất cho phép\n');

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

%**************************** Viết tiếp từ bài của souce chính **********************************************

%% Ứng suất tiếp xúc và ứng suất uốn của bánh chủ động
fprintf('\nỨng suất tiếp xúc của bánh chủ động:\n');

% Các hệ số chọn sơ bộ theo tài liệu: Z_R = 1; Z_v = 1; K_xH = 1; Y_R = 1; Y_S = 1; K_xF = 1;
Z_R = 1; Z_v = 1; K_xH = 1;
Y_R = 1; Y_S = 1; K_xF = 1;

% Tính sigma_H1 (ứng suất tiếp xúc cho phép bánh chủ động)
sigma_H1 = sigma_Hlim1 / S_H1 * Z_R * Z_v * K_xH * K_HL1;
fprintf('  sigma_H1 (ứng suất tiếp xúc cho phép bánh chủ động) = %.2f MPa\n', sigma_H1);

% Tính sigma_F1 (ứng suất uốn cho phép bánh chủ động)
sigma_F1 = sigma_Flim1 / S_F1 * Y_R * Y_S * K_xF * K_FL1;
fprintf('  sigma_F1 (ứng suất uốn cho phép bánh chủ động) = %.2f MPa\n', sigma_F1);

%% Ứng suất tiếp xúc và ứng suất uốn của bánh bị động
fprintf('\nỨng suất tiếp xúc của bánh bị động:\n');

% Tính sigma_H2 (ứng suất tiếp xúc cho phép bánh bị động)
sigma_H2 = sigma_Hlim2 / S_H2 * Z_R * Z_v * K_xH * K_HL2;
fprintf('  sigma_H2 (ứng suất tiếp xúc cho phép bánh bị động) = %.2f MPa\n', sigma_H2);

% Tính sigma_F2 (ứng suất uốn cho phép bánh bị động)
sigma_F2 = sigma_Flim2 / S_F2 * Y_R * Y_S * K_xF * K_FL2;
fprintf('  sigma_F2 (ứng suất uốn cho phép bánh bị động) = %.2f MPa\n', sigma_F2);

%% Ứng suất tiếp xúc cho phép của  bộ truyền bánh răng trụ răng nghiêng
sigma_Hsb = (sigma_H1 + sigma_H2) / 2;
fprintf('\nỨng suất tiếp xúc cho phép của bộ truyền bánh răng trụ răng nghiêng: sigma_Hsb = (%.2f + %.2f) / 2 = %.2f MPa\n', sigma_H1, sigma_H2, sigma_Hsb);
%% Ứng suất uốn cho phép của  bộ truyền bánh răng trụ răng nghiêng
sigma_Hfb = (sigma_F1 + sigma_F2) / 2;
fprintf('Ứng suất uốn cho phép của bộ truyền bánh răng trụ răng nghiêng: sigma_Hfb = (%.2f + %.2f) / 2 = %.2f MPa\n', sigma_F1, sigma_F2, sigma_Hfb);
%% 2.3: Xác định sơ bộ khoảng cách trục

%% Xác định hệ số phụ thuộc vật liệu làm răng
% Tra bảng 6.5 ta được:
K_a = 43 ; % MPa^1/3 ** Giá trị thay đổi theo bảng trường hợp nên phải tra bảng  6.5 **
fprintf("K_a = %d MPa^(1/3)\n", K_a);

%% Hệ số chiều rộng vành đai
% Chọn psi_ba =

psi_ba = input(['Nhập hệ số chiều rộng vành đai psi_ba (0.3 đến 0.4, Enter để mặc định 0.3):\n' ...
    '  - psi_ba là hệ số chiều rộng vành đai, thường chọn từ 0.3 đến 0.4 theo sách TÍNH TOÁN HỆ DẪN ĐỘNG.\n' ...
    '  Giá trị bạn muốn nhập: ']);
if isempty(psi_ba)
    psi_ba = 0.3;
end
if psi_ba < 0.3 || psi_ba > 0.4
    fprintf('  Giá trị psi_ba không hợp lệ, tự động chọn psi_ba = 0.3\n');
    psi_ba = 0.3;
end
fprintf('  psi_ba = %.2f\n', psi_ba);

%% Tính hệ số chiều rộng vành đai bộ truyền (psi_bd)
psi_bd = 0.53 * psi_ba * (u + 1);
fprintf('  psi_bd = 0.53 * %.2f * (%.2f + 1) = %.2f\n', psi_ba, u, psi_bd);
% Làm tròn psi_bd theo giá trị của bảng 6.7
psi_bd_table = [0.8 1.0 1.2 1.4 1.6 1.8 2.0 2.2 2.4 2.6 2.8 3.0];
[~, idx] = min(abs(psi_bd_table - psi_bd));
psi_bd_rounded = psi_bd_table(idx);
fprintf('  Chọn psi_bd theo bảng 6.7: psi_bd = %.2f\n', psi_bd_rounded);

%% Chọn sơ đồ truyền động (1-7)
fprintf('\nChọn sơ đồ truyền động (1-7) theo bảng 6.7:\n');
fprintf('  1: Truyền động đơn\n  2: Truyền động kép\n  3: Truyền động ba\n  4: Truyền động bốn\n  5: Truyền động năm\n  6: Truyền động sáu\n  7: Truyền động bảy\n');
so_do = input('Nhập số sơ đồ truyền động (1-7): ');
if isempty(so_do) || so_do < 1 || so_do > 7
    fprintf('  Giá trị không hợp lệ, tự động chọn sơ đồ 1\n');
    so_do = 1;
end

%% Bảng K_Hbeta ứng với psi_bd và sơ đồ (HB1 <= 350, HB2 <= 350)
psi_bd_bang = [0.2 0.4 0.6 0.8 1.0 1.2 1.4 1.6];
K_Hbeta_bang = [
    1.08 1.18 1.31 1.45 NaN NaN NaN NaN; % sơ đồ 1
    1.05 1.12 1.19 1.27 NaN NaN NaN NaN; % sơ đồ 2
    1.02 1.05 1.07 1.12 1.15 1.20 1.24 1.28; % sơ đồ 3
    1.01 1.03 1.05 1.08 1.11 1.13 1.17 1.21; % sơ đồ 4
    1.01 1.02 1.03 1.05 1.07 1.10 1.13 1.16; % sơ đồ 5
    1.00 1.01 1.02 1.03 1.05 1.06 1.07 1.11; % sơ đồ 6
    1.00 1.01 1.02 1.02 1.03 1.04 1.05 1.06; % sơ đồ 7
    ];
% Tìm vị trí psi_bd_rounded gần nhất trong bảng
[~, idx_psi] = min(abs(psi_bd_bang - psi_bd_rounded));
K_Hbeta = K_Hbeta_bang(so_do, idx_psi);
if isnan(K_Hbeta)
    fprintf('  psi_bd = %.2f không có giá trị K_Hbeta trong bảng 6.7, hãy chọn lại psi_bd hoặc sơ đồ!\n', psi_bd_rounded);
else
    fprintf('  K_Hbeta tra bảng 6.7 với psi_bd = %.2f, sơ đồ %d: K_Hbeta = %.2f\n', psi_bd_rounded, so_do, K_Hbeta);
    %% Tính a_w theo công thức
    a_w = K_a * (u + 1) * ((T1 * K_Hbeta) / (sigma_Hsb^2 * u * psi_ba))^(1/3);
    fprintf('\nGiá trị a_w tính được: %.2f mm\n', a_w);
    %% Làm tròn a_w về số nguyên tận cùng là 0 hoặc 5
    % Làm tròn lên số tận cùng là 0 hoặc 5
    a_w_rounded = ceil(a_w / 5) * 5;
    fprintf('Chọn a_w làm tròn thành số tận cùng là 0 hoặc 5: a_w = %d mm\n', a_w_rounded);
end

%% 2.4: Xác định các thông số ăn khớp
fprintf('\n2.4: Xác định các thông số ăn khớp\n');
%% 2.4.1: Mô đun pháp
% Tính mô đun theo công thức kinh nghiệm
m_n_min = 0.01 * a_w_rounded;
m_n_max = 0.02 * a_w_rounded;
fprintf('  Tính mô đun theo công thức kinh nghiệm: m_n = (0.01 ÷ 0.02) * a_w = %.2f ÷ %.2f mm\n', m_n_min, m_n_max);

% Chọn m_n tiêu chuẩn gần nhất theo bảng 6.8 (ưu tiên dãy 1)
m_n_tieuchuan = [1.25 1.5 2 2.5 3 4 5 6 8 10 12];
m_n_chon = m_n_tieuchuan(find(m_n_tieuchuan >= m_n_min, 1, 'first'));
if isempty(m_n_chon)
    m_n_chon = m_n_tieuchuan(end);
end
fprintf('  Chọn mô đun tiêu chuẩn gần nhất theo bảng 6.8: m_n = %.2f mm\n', m_n_chon);

%% 2.4.2: Xác định số răng

% Chọn sơ bộ góc nghiêng

% Chọn sơ bộ góc nghiêng của răng (beta)
fprintf('\n- Chọn sơ bộ góc nghiêng của răng (alpha):');
alpha = input(['\n  Nhập góc nghiêng alpha (độ, thường chọn 15 đến 30, Enter để mặc định 20):\n' ...
    '    + Góc nghiêng alpha ảnh hưởng đến độ êm, tải trọng dọc trục, chế tạo.\n' ...
    '    + Nếu không có yêu cầu đặc biệt, nên chọn alpha = 20 độ.\n' ...
    '    Giá trị bạn muốn nhập: ']);
if isempty(alpha)
    alpha = 20;
end
if alpha < 10 || alpha > 40
    fprintf('    Giá trị alpha không hợp lệ, tự động chọn alpha = 20 độ\n');
    alpha = 20;
end
fprintf('  Chọn góc nghiêng của răng alpha = %d độ\n', alpha);

% Tính số bánh răng chủ động
z1 = (2 * a_w_rounded * cosd(alpha)) / (m_n_chon * (u + 1));
z1_rounded = ceil(z1);
fprintf('\n- Tính số bánh răng chủ động:\n');
fprintf('  z1 = (2 * a_w * cos(alpha)) / (m_n * (u + 1)) = (2 * %d * cos(%d)) / (%.2f * (%.2f + 1)) = %.2f\n', a_w_rounded, alpha, m_n_chon, u, z1);
if z1_rounded <= 17
    fprintf('  Số bánh răng chủ động z1 = %d nhỏ hơn 18, không hợp lệ (phải lớn hơn 17 để tránh hiện tượng ăn khớp không tốt).\n', z1_rounded);
    z1_rounded = 18;
    fprintf('  Tự động chọn z1 = %d\n', z1_rounded);
else
    fprintf('  Chọn số bánh răng chủ động làm tròn: z1 = %d\n', z1_rounded);
end
% Tính số bánh răng bị động
z2 = z1_rounded * u;
z2_rounded = ceil(z2);
fprintf('\n- Tính số bánh răng bị động:\n');
fprintf('  z2 = z1 * u = %d * %.2f = %.2f\n', z1_rounded, u, z2);
fprintf('  Chọn số bánh răng bị động làm tròn: z2 = %d\n', z2_rounded);
% Tính tỉ số truyền thực tế
u_thucte = z2_rounded / z1_rounded;
fprintf('\n- Tỉ số truyền thực tế của bộ truyền:\n');
fprintf('  u_thucte = z2 / z1 = %d / %d = %.3f\n', z2_rounded, z1_rounded, u_thucte);
% Tính sai lệch tỉ số truyền
delta_u = abs(u_thucte - u) / u * 100;
fprintf('\n- Sai lệch tỉ số truyền:\n');
fprintf('  delta_u = |u_thucte - u| / u * 100 = |%.3f - %.3f| / %.3f * 100 = %.2f%%\n', u_thucte, u, u, delta_u);
if delta_u > 4
    fprintf('  Sai lệch tỉ số truyền vượt quá 4%%! Cần chọn lại z1 và z2 để đảm bảo yêu cầu thiết kế.\n');
else
    fprintf('  Sai lệch tỉ số truyền đạt yêu cầu (< 4%%).\n');
end
%% 2.4.3: Xác định góc ăn khớp của răng
fprintf('\n2.4.3: Xác định góc ăn khớp của răng\n');
% Tính góc ăn khớp beta_ankhop
cos_beta_ankhop = m_n_chon * (z1_rounded + z2_rounded) / (2 * a_w_rounded);
if abs(cos_beta_ankhop) > 1
    fprintf('\nGiá trị cos(beta_ankhop) không hợp lệ (|cos_beta_ankhop| > 1), kiểm tra lại thông số đầu vào!\n');
    beta_ankhop = NaN;
else
    beta_ankhop = acosd(cos_beta_ankhop);
    fprintf('\n- Tính góc ăn khớp của răng:\n');
    fprintf('  cos(beta_ankhop) = m_n * (z1 + z2) / (2 * a_w) = %.2f * (%d + %d) / (2 * %d) = %.4f\n', m_n_chon, z1_rounded, z2_rounded, a_w_rounded, cos_beta_ankhop);
    fprintf('  beta_ankhop = acosd(cos_beta_ankhop) = acosd(%.4f) = %.2f độ\n', cos_beta_ankhop, beta_ankhop);
    % Kiểm tra góc ăn khớp hợp lý
    if beta_ankhop < 8 || beta_ankhop > 20
        fprintf('  Góc ăn khớp beta_ankhop = %.2f độ không nằm trong khoảng 8÷20 độ (răng nghiêng)!\n', beta_ankhop);
    else
        fprintf('  Góc ăn khớp beta_ankhop hợp lý (8÷20 độ với răng nghiêng).\n');
    end
end
%% 2.5: Xác định ứng suất cho phép
fprintf('\n2.5: Xác định ứng suất cho phép\n');
% Ứng suất cho phép tính ở mục 2 chỉ là ứng suất cho phép sơ bộ.
% Sau khi xác định được vật liệu, các kích thước và thông số động học của bánh răng,
% cần phải xác định chính xác ứng suất cho phép.

%% 2.5.1: Xác định đường kính vòng lăn
fprintf('\n2.5.1: Xác định đường kính vòng lăn\n');
% Tính đường kính vòng lăn
dw1 = 2 * a_w_rounded / (u_thucte + 1);
dw2 = 2 * a_w_rounded - dw1;
fprintf('\n- Đường kính vòng lăn:\n');
fprintf('  dw1 = 2 * a_w / (u_thucte + 1) = 2 * %d / (%.3f + 1) = %.2f mm\n', a_w_rounded, u_thucte, dw1);
fprintf('  dw2 = 2 * a_w - dw1 = 2 * %d - %.2f = %.2f mm\n', a_w_rounded, dw1, dw2);
% Tính vận tốc vòng của bánh răng
v = pi * dw1 * n1 / 60000;
fprintf('\n- Vận tốc vòng của bánh răng:\n');
fprintf('  v = pi * dw1 * n1 / 60000 = %.2f * %.2f * %d / 60000 = %.3f m/s\n', pi, dw1, n1, v);
%% Xác định hệ số xét đến độ nhám của mặt răng làm việc (Z_R)
Z_R = 0.95;
fprintf('Giả sử bánh răng được gia công và yêu cầu độ nhám bề mặt răng nằm trong khoảng Ra = 0.63 ÷ 1.25 μm\n');
fprintf('  Z_R = %.2f\n', Z_R);
%% 2.5.2: Xác định hệ số tốc độ (Z_v)
fprintf('\n2.5.2: Xác định hệ số tốc độ (Z_v)\n');
% Z_v: hệ số xét đến ảnh hưởng của vận tốc vòng
if v > 5
    Z_v = 0.85 * v^0.1;
    fprintf('  Vì v = %.3f > 5 m/s nên Z_v = 0.85 * v^0.1 = %.3f\n', v, Z_v);
else
    Z_v = 1;
    fprintf('  Vì v = %.3f ≤ 5 m/s nên Z_v = 1\n', v);
end
%% 2.5.3: Xác định hệ số xét đến ảnh hưởng của kích thước bánh răng (K_xH)
K_xH = 1;
fprintf('  Hệ số xét đến ảnh hưởng của kích thước bánh răng K_xH = %.2f\n', K_xH);
%% 2.5.4: Xác định hệ số của độ nhám mặt lượn chân răng (Y_R)
Y_R = 1;
fprintf('  Hệ số của độ nhám mặt lượn chân răng Y_R = %.2f\n', Y_R);
%% 2.5.5: Xác định hệ số xét đến độ nhạy của vật liệu với sự tập trung ứng suất (Y_S)
% Y_S: hệ số xét đến độ nhạy của vật liệu với sự tập trung ứng suất
% Công thức: Y_S = 1.08 - 0.0695*ln(m), với m là mô đun (mm)
Y_S = 1.08 - 0.0695 * log(m_n_chon);
fprintf('  Y_S = 1.08 - 0.0695 * ln(%.3f) = %.3f\n', m_n_chon, Y_S);
%% 2.5.6: Xác định hệ số xét đến ảnh hưởng của của kích thước bánh răng đến độ bền uốn (K_xF)
K_xF = 1;
fprintf('  Hệ số xét đến ảnh hưởng của của kích thước bánh răng đến độ bền uốn (K_xF) = %.2f\n', K_xF);

%% 2.5.7: Tính ứng suất tiếp xúc cho phép sigma_H_allow
sigma_H_allow = sigma_Hsb * Z_R * Z_v * K_xH;
fprintf('\n- Ứng suất tiếp xúc cho phép sigma_H_allow = sigma_Hsb * Z_R * Z_v * K_xH = %.2f * %.2f * %.2f * %.2f = %.2f MPa\n', sigma_Hsb, Z_R, Z_v, K_xH, sigma_H_allow);
%% 2.5.8: Tính ứng suất uốn cho phép sigma_Fcd_allow (bánh chủ động)
sigma_Fcd_allow = sigma_F1 * Y_R * Y_S * K_xF;
fprintf('- Ứng suất uốn cho phép sigma_Fcd_allow = sigma_F1 * Y_R * Y_S * K_xF = %.2f * %.2f * %.3f * %.2f = %.2f MPa\n', sigma_F1, Y_R, Y_S, K_xF, sigma_Fcd_allow);
%% 2.5.9: Tính ứng suất uốn cho phép sigma_Fbd (bánh bị động)
sigma_Fbd_allow = sigma_F2 * Y_R * Y_S * K_xF;
fprintf('- Ứng suất uốn cho phép sigma_Fbd_allow = sigma_F2 * Y_R * Y_S * K_xF = %.2f * %.2f * %.3f * %.2f = %.2f MPa\n', sigma_F2, Y_R, Y_S, K_xF, sigma_Fbd_allow);
%% 2.6: Kiểm nghiệm bộ truyền bánh răng
fprintf('\n2.6: Kiểm nghiệm bộ truyền bánh răng\n');
%% 2.6.1: Kiểm nghiệm về độ bền tiếp xúc
fprintf('\n2.6.1: Kiểm nghiệm về độ bền tiếp xúc\n');
%% 2.6.1a: Tính hằng số đàn hồi của vật liệu (Z_M)
Z_M = 274; % MPa^0.5 ** Giá trị thay đổi theo bảng trường hợp nên phải tra bảng  6.5 **
fprintf('  Hằng số đàn hồi của vật liệu Z_M = %d \n', Z_M);
%% 2.6.1b: Tính hệ số xét đền sự trùng khớp của răng (Z_epsilon)
%Trường hợp code này là răng nghiêng
%% Tính chiều rộng vành đai
% Tính chiều rộng vành đai b_omega
b_omega = psi_ba * a_w_rounded;
fprintf('  Chiều rộng vành đai b_omega = psi_ba * a_w = %.2f * %d = %.2f mm\n', psi_ba, a_w_rounded, b_omega);
%% Tính hệ số trùng hợp khớp dọc (epsilon_beta)
% Tính hệ số trùng hợp khớp dọc epsilon_beta
epsilon_beta = b_omega * sind(beta_ankhop) / (m_n_chon * pi);
fprintf('  Hệ số trùng hợp khớp dọc epsilon_beta = b_omega * sin(beta_ankhop) / (m_n * pi) = %.2f * sin(%d) / (%.2f * %.2f) = %.3f\n', b_omega, beta_ankhop, m_n_chon, pi, epsilon_beta);
%% Tính hệ số trùng khớp ngang (epsilon_alpha)
% Tính hệ số trùng khớp ngang epsilon_alpha
epsilon_alpha = (1.88 - 3.2 * (1/z1_rounded + 1/z2_rounded)) * cosd(beta_ankhop);
fprintf('  Hệ số trùng khớp ngang epsilon_alpha = [1.88 - 3.2*(1/z1 + 1/z2)]*cos(beta_ankhop) = [1.88 - 3.2*(1/%.0f + 1/%.0f)]*cos(%.2f) = %.3f\n', z1_rounded, z2_rounded, beta_ankhop, epsilon_alpha);

%% Tính toán hệ số xét đến sự trùng khớp của răng (Z_epsilon) cho răng nghiêng
if epsilon_beta < 1
    Z_epsilon = sqrt(((4 - epsilon_alpha) * (1 - epsilon_beta) / 3 + epsilon_beta) / epsilon_alpha);
    fprintf('  Vì epsilon_beta = %.3f < 1 nên Z_epsilon = sqrt(((4 - %.3f)*(1 - %.3f)/3 + %.3f)/%.3f) = %.3f\n', epsilon_beta, epsilon_alpha, epsilon_beta, epsilon_beta, epsilon_alpha, Z_epsilon);
else
    Z_epsilon = sqrt(1 / epsilon_alpha);
    fprintf('  Vì epsilon_beta = %.3f >= 1 nên Z_epsilon = sqrt(1/%.3f) = %.3f\n', epsilon_beta, epsilon_alpha, Z_epsilon);
end
%% 2.6.1c: Tính hệ số xét đến hình dạng bề mặt răng (Z_H)
% Tính hệ số xét đến hình dạng bề mặt răng Z_H
%% Tính beta_b
beta_b = atand(cosd(alpha) * tand(beta_ankhop));
fprintf('  beta_b = atand(cos(alpha) * tan(beta_ankhop)) = atand(cos(%d) * tan(%.2f)) = %.3f độ\n', alpha, beta_ankhop, beta_b);
%% Tính alpha_wt && alpha_t
% Tính alpha_tw = alpha_t theo công thức: alpha_tw = atand(tand(alpha) / cos(beta_ankhop))
alpha_tw = atand(tand(alpha) / cosd(beta_ankhop));
alpha_t = alpha_tw;
fprintf('  alpha_tw = alpha_t = atand(tan(alpha) / cos(beta_ankhop)) = atand(tan(%d) / cos(%.2f)) = %.3f độ\n', alpha, beta_ankhop, alpha_tw);
%% Tính Z_H
% Tính Z_H theo công thức: Z_H = sqrt(2 * cos(beta_b) / sin(2 * alpha_tw))
Z_H = sqrt(2 * cosd(beta_b) / sind(2 * alpha_tw));
fprintf('  Z_H = sqrt(2 * cos(beta_b) / sin(2 * alpha_tw)) = sqrt(2 * cos(%.3f) / sin(2 * %.3f)) = %.3f\n', beta_b, alpha_tw, Z_H);
%% 2.6.1d: Tính hệ số tải trọng khi tính về tiếp xúc (K_H)
%% Thông số tra các bảng 6.13, 6.14, 6.15 và 6.16
fprintf ('\n Chọn cấp chính xác 9 bảng 6.13\n');
%% chọn cấp 9 theo bảng 6.13
K_Halpha = 1.13; %** Giá trị thay đổi theo bảng trường hợp nên phải tra bảng  6.14 **
delta_H = 0.002; %** Giá trị thay đổi theo bảng trường hợp nên phải tra bảng  6.15 **
g0 = 73; %** Giá trị thay đổi theo bảng trường hợp nên phải tra bảng  6.16 **
% Tính vH theo công thức: vH = delta_H * g0 * sqrt(a_w_rounded / u) * sqrt(psi_bd_rounded / u)
vH = delta_H * g0 * v * sqrt(a_w_rounded / u);
fprintf('  vH = delta_H * g0 * sqrt(a_w / u) = %.3f * %.0f * sqrt(%d / %.2f) = %.3f\n', delta_H, g0, a_w_rounded, u, vH);
%% Theo 6.63 sách Hệ dẫn động tính được K_Hv
% Tính K_Hv theo công thức: K_Hv = 1 + vH * b_omega * m_n_chon / (2 * T1 * K_Hbeta * K_Halpha)
K_Hv = 1 + vH * b_omega * m_n_chon / (2 * T1 * K_Hbeta * K_Halpha);
fprintf('  K_Hv = 1 + vH * b_omega * m_n / (2 * T1 * K_Hbeta * K_Halpha) = 1 + %.3f * %.2f * %.2f / (2 * %.1f * %.2f * %.2f) = %.3f\n', vH, b_omega, m_n_chon, T1, K_Hbeta, K_Halpha, K_Hv);
%% Tính K_H
K_H = K_Hv * K_Hbeta * K_Halpha;
fprintf('  K_H = K_Hv * K_Hbeta * K_Halpha = %.3f * %.2f * %.2f = %.3f\n', K_Hv, K_Hbeta, K_Halpha, K_H);
%% 2.6.1e: Kiểm nghiệm độ bền tiếp xúc
% Tính sigma_H theo công thức: sigma_H = (Z_M * Z_H * Z_epsilon / dw1) * sqrt(2 * T1 * K_H * (u + 1) / (b_omega * u))
sigma_H = (Z_M * Z_H * Z_epsilon / dw1) * sqrt(2 * T1 * K_H * (u + 1) / (b_omega * u));
fprintf('  sigma_H = (Z_M * Z_H * Z_epsilon / dw1) * sqrt(2 * T1 * K_H * (u + 1) / (b_omega * u)) = (%.2f * %.3f * %.3f / %.2f) * sqrt(2 * %.1f * %.3f * (%.2f + 1) / (%.2f * %.2f)) = %.2f MPa\n', Z_M, Z_H, Z_epsilon, dw1, T1, K_H, u, b_omega, u, sigma_H);
ratio_sigma_H = abs(sigma_H - sigma_H_allow) / sigma_H_allow * 100;
fprintf('\nKiểm nghiệm độ bền tiếp xúc:\n');
fprintf('  Độ lệch ứng suất tiếp xúc Delta_sigma_H = (sigma_H - sigma_H_allow) / sigma_H_allow * 100 = (%.2f - %.2f) / %.2f * 100 = %.2f%%\n', sigma_H, sigma_H_allow, sigma_H_allow, ratio_sigma_H);
if ratio_sigma_H <= 10
    fprintf('  Đạt yêu cầu: ratio_sigma_H = %.2f%% ≤ 10%%. Bộ truyền đảm bảo độ bền tiếp xúc.\n', ratio_sigma_H);
else
    fprintf('  Không đạt yêu cầu: ratio_sigma_H = %.2f%% > 10%%. Cần tăng kích thước hoặc thay đổi thông số thiết kế.\n', ratio_sigma_H);
end
%% 2.6.2: Kiểm nghiệm về độ bền uốn
fprintf('\n2.6.2: Kiểm nghiệm về độ bền uốn\n');
%% 2.6.2a: Tính hệ số phân bố đều tải trọng giữa các răng khi tính về độ uốn (K_Falpha)
fprintf('\n2.6.2a: Tính hệ số phân bố đều tải trọng giữa các răng K_Falpha theo bảng 6.14\n');

% Tạo bảng tra K_Falpha theo bảng 6.14
% Vận tốc vòng (m/s)
v_bang = [2.5, 5, 10, 15, 20, 25];

% Cấp chính xác và giá trị K_Falpha tương ứng
% Cấp 6
K_Falpha_cap6 = [1.05, 1.07, 1.10, 1.13, 1.17, 1.20];
% Cấp 7
K_Falpha_cap7 = [1.12, 1.16, 1.22, 1.25, 1.35, NaN];
% Cấp 8
K_Falpha_cap8 = [1.22, 1.27, 1.37, 1.45, NaN, NaN];
% Cấp 9
K_Falpha_cap9 = [1.37, 1.40, NaN, NaN, NaN, NaN];

% Chọn cấp chính xác (giả sử cấp 9 như đã chọn ở trên)
cap_chinh_xac = input('Nhập cấp chính xác (6, 7, 8, 9, Enter để mặc định 9): ');
if isempty(cap_chinh_xac) || ~ismember(cap_chinh_xac, [6 7 8 9])
    cap_chinh_xac = 9;
    fprintf('  Giá trị không hợp lệ, tự động chọn cấp chính xác = 9\n');
end
fprintf('  Chọn cấp chính xác = %d\n', cap_chinh_xac);
fprintf('  Vận tốc vòng v = %.3f m/s\n', v);

% Chọn bảng K_Falpha theo cấp chính xác
switch cap_chinh_xac
    case 6
        K_Falpha_table = K_Falpha_cap6;
        fprintf('  Sử dụng bảng K_Falpha cho cấp 6\n');
    case 7
        K_Falpha_table = K_Falpha_cap7;
        fprintf('  Sử dụng bảng K_Falpha cho cấp 7\n');
    case 8
        K_Falpha_table = K_Falpha_cap8;
        fprintf('  Sử dụng bảng K_Falpha cho cấp 8\n');
    case 9
        K_Falpha_table = K_Falpha_cap9;
        fprintf('  Sử dụng bảng K_Falpha cho cấp 9\n');
    otherwise
        K_Falpha_table = K_Falpha_cap9;
        fprintf('  Cấp không hợp lệ, mặc định sử dụng cấp 9\n');
end

% Tính K_Falpha bằng nội suy tuyến tính
if v <= v_bang(1)
    K_Falpha = K_Falpha_table(1);
    fprintf('  Vì v = %.3f <= %.1f m/s nên K_Falpha = %.3f\n', v, v_bang(1), K_Falpha);
elseif v >= v_bang(end)
    % Tìm giá trị cuối cùng không phải NaN
    valid_indices = ~isnan(K_Falpha_table);
    if any(valid_indices)
        last_valid_idx = find(valid_indices, 1, 'last');
        K_Falpha = K_Falpha_table(last_valid_idx);
        fprintf('  Vì v = %.3f >= %.1f m/s nên K_Falpha = %.3f (giá trị cuối trong bảng)\n', v, v_bang(last_valid_idx), K_Falpha);
    else
        K_Falpha = 1.2; % Giá trị mặc định
        fprintf('  Không có giá trị hợp lệ trong bảng, sử dụng K_Falpha = %.3f\n', K_Falpha);
    end
else
    % Nội suy tuyến tính
    % Tìm hai điểm gần nhất để nội suy
    idx_lower = find(v_bang <= v, 1, 'last');
    idx_upper = find(v_bang >= v, 1, 'first');

    % Kiểm tra xem có giá trị NaN không
    if isnan(K_Falpha_table(idx_lower)) || isnan(K_Falpha_table(idx_upper))
        % Nếu có NaN, tìm giá trị gần nhất không phải NaN
        valid_indices = ~isnan(K_Falpha_table);
        [~, closest_idx] = min(abs(v_bang(valid_indices) - v));
        valid_v_values = v_bang(valid_indices);
        valid_K_values = K_Falpha_table(valid_indices);
        K_Falpha = valid_K_values(closest_idx);
        fprintf('  Do có giá trị NaN trong bảng, chọn giá trị gần nhất: v = %.1f m/s, K_Falpha = %.3f\n', valid_v_values(closest_idx), K_Falpha);
    else
        % Nội suy tuyến tính
        v1 = v_bang(idx_lower);
        v2 = v_bang(idx_upper);
        K1 = K_Falpha_table(idx_lower);
        K2 = K_Falpha_table(idx_upper);

        if idx_lower == idx_upper
            K_Falpha = K1;
            fprintf('  Vận tốc v = %.3f m/s trùng với giá trị trong bảng, K_Falpha = %.3f\n', v, K_Falpha);
        else
            K_Falpha = K1 + (K2 - K1) * (v - v1) / (v2 - v1);
            fprintf('  Nội suy tuyến tính giữa v1 = %.1f m/s (K_Falpha = %.3f) và v2 = %.1f m/s (K_Falpha = %.3f)\n', v1, K1, v2, K2);
            fprintf('  K_Falpha = %.3f + (%.3f - %.3f) * (%.3f - %.1f) / (%.1f - %.1f) = %.3f\n', K1, K2, K1, v, v1, v2, v1, K_Falpha);
        end
    end
end

fprintf('  Kết quả: K_Falpha = %.3f\n', K_Falpha);
%% 2.6.2b: Tính là hệ số phân bố không đều tải trọng trên chiều rộng vành răng khi tính về độ bền uốn (K_Fbeta)
fprintf('\n2.6.2b: Tính hệ số phân bố không đều tải trọng trên chiều rộng vành răng K_Fbeta theo bảng 6.7\n');

% --- Công thức tra bảng 6.7 để tính K_Fbeta ---
% Bảng giá trị psi_bd
psi_bd_bang = [0.2 0.4 0.6 0.8 1.0 1.2 1.4 1.6];

% Bảng giá trị K_Fbeta cho HB1, HB2 <= 350
K_Fbeta_bang_350 = [
    1.18 1.38 1.61 1.95 NaN NaN NaN NaN; % sơ đồ 1
    1.1 1.21 1.39 1.58 NaN NaN NaN NaN; % sơ đồ 2
    1.05 1.11 1.17 1.24 1.32 1.41 1.5 1.6; % sơ đồ 3
    1.03 1.06 1.12 1.17 1.23 1.30 1.38 1.45; % sơ đồ 4
    1.02 1.05 1.08 1.12 1.16 1.22 1.28 1.37; % sơ đồ 5
    1.01 1.03 1.05 1.07 1.10 1.14 1.19 1.26; % sơ đồ 6
    1.00 1.01 1.02 1.03 1.05 1.08 1.12 1.15; % sơ đồ 7
    ];

% Bảng giá trị K_Fbeta cho HB1, HB2 > 350
K_Fbeta_bang_400 = [
    1.31 1.69 NaN NaN NaN NaN NaN NaN; % sơ đồ 1
    1.20 1.42 1.71 NaN NaN NaN NaN NaN; % sơ đồ 2
    1.08 1.18 1.30 1.43 1.57 1.72 NaN NaN; % sơ đồ 3
    1.04 1.06 1.17 1.27 1.39 1.53 1.70 NaN; % sơ đồ 4
    1.03 1.10 1.12 1.20 1.28 1.41 1.53 NaN; % sơ đồ 5
    1.02 1.04 1.18 1.14 1.20 1.30 1.40 NaN; % sơ đồ 6
    1.00 1.01 1.02 1.03 1.05 1.08 1.12 1.15; % sơ đồ 7
    ];

% Chọn bảng theo HB1, HB2
if HB1 <= 350 && HB2 <= 350
    K_Fbeta_bang = K_Fbeta_bang_350;
    fprintf('  Chọn bảng K_Fbeta cho HB1, HB2 <= 350\n');
else
    K_Fbeta_bang = K_Fbeta_bang_400;
    fprintf('  Chọn bảng K_Fbeta cho HB1, HB2 > 350\n');
end

% Tìm vị trí psi_bd gần nhất trong bảng
[~, idx_psi] = min(abs(psi_bd_bang - psi_bd_rounded));
% Kiểm tra sơ đồ truyền động (so_do)
if so_do < 1 || so_do > 7
    so_do = 1;
    fprintf('  Sơ đồ truyền động không hợp lệ, tự động chọn sơ đồ 1\n');
end

K_Fbeta = K_Fbeta_bang(so_do, idx_psi);
fprintf('  K_Fbeta tra bảng 6.7 với psi_bd = %.2f, sơ đồ %d: K_Fbeta = %.3f\n', psi_bd_rounded, so_do, K_Fbeta);
%% 2.6.2c: Tính hệ số kể đến tải trọng động xuất hiện trong vùng ăn khớp khi tính về uốn (K_Fv)
% Tra bảng 6.15 cho bánh răng nghiêng
if HB1 <= 350 && HB2 <= 350
    delta_F = 0.006;
    fprintf('  delta_F tra bảng 6.15 (bánh răng nghiêng, HB1 <= 350, HB2 <= 350): delta_F = %.3f\n', delta_F);
else
    delta_F = 0.006;
    fprintf('  delta_F tra bảng 6.15 (bánh răng nghiêng, HB1 > 350 hoặc HB2 > 350): delta_F = %.3f\n', delta_F);
end
vF = delta_F * g0 * v * sqrt(a_w_rounded / u);
fprintf('  vF = delta_F * g0 * sqrt(a_w / u) = %.3f * %.0f * sqrt(%d / %.2f) = %.3f\n', delta_F, g0, a_w_rounded, u, vF);

% Tính hệ số kể đến tải trọng động xuất hiện trong vùng ăn khớp khi tính về uốn (K_Fv)
K_Fv = 1 + vF * b_omega * dw1 / (2 * T1 * K_Hbeta * K_Halpha);
fprintf('  K_Fv = 1 + vF * b_omega * dw1 / (2 * T1 * K_Hbeta * K_Halpha) = 1 + %.3f * %.2f * %.2f / (2 * %.1f * %.2f * %.2f) = %.3f\n', vF, b_omega, dw1, T1, K_Hbeta, K_Halpha, K_Fv);
%% 2.6.2d: Tính hệ số ảnh hướng đến sự trùng khớp của răng (Y_epsilon)
% Tính hệ số ảnh hưởng đến sự trùng khớp của răng (Y_epsilon)
Y_epsilon = 1 / epsilon_alpha;
fprintf('  Y_epsilon = 1 / epsilon_alpha = 1 / %.3f = %.3f\n', epsilon_alpha, Y_epsilon);
%% 2.6.2e: Tính hệ số kể đến độ nghiêng của răng (Y_beta)
% Tính hệ số kể đến độ nghiêng của răng (Y_beta)
Y_beta = 1 - beta_b / 140;
fprintf('  Y_beta = 1 - beta_b / 140 = 1 - %.3f / 140 = %.3f\\n', beta_b, Y_beta);
