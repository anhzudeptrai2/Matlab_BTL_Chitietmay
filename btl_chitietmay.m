% ==================================================================
% BÀI TẬP LỚN CHI TIẾT MÁY - BỘ TRUYỀN ĐAI
% ==================================================================
% Đề: 1/VTL.1.1.25.BTL.L21
% Sinh viên: Lưu Quang Vũ - 23011608
% Lớp: K17-KTCDT_2
% ==================================================================

clear all; clc; close all;

fprintf('==========================================================\n');
fprintf('  BÀI TẬP LỚN CHI TIẾT MÁY - BỘ TRUYỀN ĐAI THANG\n');
fprintf('  Đề: 1/VTL.1.1.25.BTL.L21\n');
fprintf('  SV: Lưu Quang Vũ - 23011608\n');
fprintf('==========================================================\n\n');

%% DỮ LIỆU ĐẦU VÀO (từ đề bài)
fprintf('DỮ LIỆU ĐẦU VÀO:\n');
fprintf('----------------\n');

% Thông số từ bảng
P1 = 1.2; % kW - Công suất trên trục chủ động
n1 = 720; % vòng/phút - Số vong quay trên trục chủ động
T1 = 15916.7; % N.mm - Moment xoắn của trục chủ động
u = 2.8; % Tỉ số truyền của bộ truyền

% Thông số thiết kế
ca = 3; % ca làm việc
beta_goc = 35; % độ - Góc nghiêng bộ truyền so với phương nằm ngang
pi = 3.14; % Hằng số Pi
%Trạng thái làm việc: Tải trọng tĩnh, làm việc va đập nhẹ

fprintf('Công suất trục I: P1 = %.2f kW\n', P1);
fprintf('Tốc độ trục I: n1 = %.0f vòng/phút\n', n1);
fprintf('Moment xoắn trục I: T1 = %.2f N.mm\n', T1);
fprintf('Số ca làm việc: %d ca\n', ca);
fprintf('Góc nghiêng: β = %d°\n', beta_goc);

%% TÍNH TOÁN TỶ SỐ TRUYỀN VÀ CÁC THÔNG SỐ CƠ BẢN
fprintf('\n==========================================================\n');
fprintf('  TÍNH TOÁN CÁC THÔNG SỐ CƠ BẢN\n');
fprintf('==========================================================\n\n');

% 1.1: Chọn loại đai
P1 = 1.2; % kW - Công suất trên trục chủ động
if(P1 < 2 && n1 == 720)
    fprintf('1.1: Chọn loại đai: Đai thang thường loại A\n');
    fprintf('Loại đai thang thường loại A phù hợp với công suất P1 < 2 kW và n1 < 1000 vòng/phút\n');
else
    fprintf('Loại đai không phù hợp với công suất và tốc độ trục I\n');
end
% Điều kiện va đập nhẹ nên ta chọn vật liệu đai là đai vải cao su.
%1.2: Xác định đường kính đai
%Chọn đường kính bánh đai nhỏ:
% Theo công thức: d1 = (1100:1300) * (P1/n1)^(1/3)
k = 1100:1300;
d1_min = k(1) * (P1/n1)^(1/3);
d1_max = k(end) * (P1/n1)^(1/3);
fprintf('1.2: Đường kính bánh đai nhỏ d1 nằm trong khoảng: %.2f mm đến %.2f mm\n', d1_min, d1_max);

% Dãy tiêu chuẩn đường kính bánh đai (mm)
d1_standard = [63, 71, 80, 90, 100, 112, 125, 140, 160, 180, 200, 224, 250, 280, 315, 355, 400, 450, 500, 560, 630, 710, 800, 900, 1000, 1120, 1250, 1400, 1600, 1800, 2000, 2240, 2500, 2800, 3150, 3550, 4000];

% Tự động chọn d1 theo dãy tiêu chuẩn (lớn hơn hoặc bằng d1_min)
idx = find(d1_standard >= d1_min, 1, 'first');
if ~isempty(idx)
    d1_chon = d1_standard(idx);
    fprintf('Chọn đường kính bánh đai nhỏ tiêu chuẩn: d1 = %d mm\n', d1_chon);
else
    fprintf(' Không có giá trị tiêu chuẩn phù hợp cho d1!\n');
end
% Kiểm tra vận tốc đai
v = (pi * d1_chon * n1) / (60 * 1000); % m/s
if v < 25
    fprintf('Vận tốc đai v = %.2f m/s thỏa mãn (v < 25 m/s)\n', v);
else
    fprintf('Vận tốc đai v = %.2f m/s không thỏa mãn (v >= 25 m/s)\n', v);
end
%Chọn hệ số trượt tương đối
epsilon = 0.02; % Hệ số trượt tương đối
fprintf('Hệ số trượt tương đối: ε = %.2f\n', epsilon);
%Tính đường kính bánh đai lớn
% Tính d2 sơ bộ
d2 = u * d1_chon * (1 - epsilon); % mm
%Chọn d2 theo dãy tiêu chuẩn như d1
d2_standard = [63, 71, 80, 90, 100, 112, 125, 140, 160, 180, 200, 224, 250, 280, 315, 355, 400, 450, 500, 560, 630, 710, 800, 900, 1000, 1120, 1250, 1400, 1600, 1800, 2000, 2240, 2500, 2800, 3150, 3550, 4000];

% Tự động chọn d2 theo dãy tiêu chuẩn (lớn hơn hoặc bằng d2_min)
idx = find(d2_standard >= d2, 1, 'first');
if ~isempty(idx)
    d2_chon = d2_standard(idx);
    fprintf('Chọn đường kính bánh đai lớn tiêu chuẩn: d2 = %d mm\n', d2_chon);
else
    fprintf(' Không có giá trị tiêu chuẩn phù hợp cho d2!\n');
end
%Tỉ số truyền thực tế
u_thuc_te = d2_chon / d1_chon / (1 - epsilon);
u_thuc_te_round = floor(u_thuc_te*100)/100; % Làm tròn xuống 2 chữ số thập phân
fprintf('Tỉ số truyền thực tế: u_tt = %.2f\n', u_thuc_te_round);

% Tính sai số tỉ số truyền
delta_u = abs(u_thuc_te_round - u)/u*100;
fprintf('Sai số tỉ số truyền: delta_u = %.2f%%\n', delta_u);
if delta_u <= 4
    fprintf('Sai số tỉ số truyền thỏa mãn (<= 4%%)\n');
else
    fprintf('Sai số tỉ số truyền không thỏa mãn (> 4%%)\n');
end
%Tính khoảng cách trục
%Kiểm tra bảng 4.14
a = d2_chon * 1.2; % mm
fprintf('Khoảng cách trục a = %.2f mm\n', a);
%Kiểm tra điều kiện của a
if 0.55 * (d1_chon + d2_chon) + 6 <= a && a <= 2 * (d1_chon + d2_chon)
    fprintf('Khoảng cách trục a thỏa mãn điều kiện\n');
else
    fprintf('Khoảng cách trục a không thỏa mãn điều kiện\n');
end
%1.4: Tính chiều dài đai
%Chiều dài đai L:
L = 2 * a + (pi/2) * (d1_chon + d2_chon) + ((d2_chon - d1_chon)^2) / (4 * a); % mm
fprintf('Chiều dài đai L = %.2f mm\n', L);
%Chọn chiều dài đai theo dãy tiêu chuẩn
L_standard = [1000, 1120, 1250, 1400, 1600, 1800, 2000, 2240, 2500, 2800, 3150, 3550, 4000, 4500, 5000, 5600, 6300, 7100, 8000, 9000, 10000]; % mm
idx = find(L_standard >= L, 1, 'first');
if ~isempty(idx)
    L_chon = L_standard(idx);
    fprintf('Chọn chiều dài đai tiêu chuẩn: L = %d mm\n', L_chon);
else
    fprintf(' Không có giá trị tiêu chuẩn phù hợp cho L!\n');
end
%Tính số vòng chạy i của đai trong 1s
i = (v * 1000) / L_chon; % vòng/s
fprintf('Số vòng chạy i của đai trong 1s: i = %.4f vòng/s\n', i);
%Tính khoảng cách trục a theo chiều dài đai tiêu chuẩn L = 2000
lamda = L_chon - (pi/2) * (d1_chon + d2_chon);
fprintf ('lamda = %.2f mm\n', lamda);
delta_d = (d2_chon - d1_chon)/2;
fprintf('delta_d = %.2f mm\n', delta_d);

% Tính lại khoảng cách trục a_chon theo công thức chuẩn
a_chon = (lamda + sqrt(lamda^2 - 8*delta_d^2)) / 4;
fprintf('Khoảng cách trục a (tính lại theo L tiêu chuẩn) = %.2f mm\n', a_chon);
%Tính góc ôm
alpha = 180 - 57 * (d2_chon - d1_chon) / a_chon; % độ
fprintf('Góc ôm α = %.2f°\n', alpha);
if alpha >= 120
    fprintf('Góc ôm thỏa mãn yêu cầu \n');
else
    fprintf('Góc ôm không thỏa mãn yêu cầu \n');
end
%1.5: Xác định số đai
% Tra hệ số góc ôm đai C_alpha theo bảng 4.15
alpha_table = [180 170 160 150 140 130 120 110 100 90 80 70];
C_alpha_table = [1 0.98 0.95 0.92 0.89 0.86 0.82 0.78 0.73 0.68 0.62 0.56];

if alpha >= 180
    C_alpha = 1;
elseif alpha <= 70
    C_alpha = 0.56;
else
    idx_alpha = find(alpha_table <= alpha, 1, 'first');
    if isempty(idx_alpha)
        C_alpha = 0.56;
    else
        C_alpha = C_alpha_table(idx_alpha);
    end
end
fprintf('Hệ số góc ôm đai C_alpha = %.3f\n', C_alpha);
%Xác định hệ số kể đến ảnh hưởng của chiều dài đai C_l theo bảng 4.16
%Xác định hệ số L/l0; l0 = 1700 < đai thang thường loại A>
l0 = 1700; % mm

L_l0 = L_chon/l0;
fprintf('Tỉ số L/l0 = %.2f\n', L_l0);

% Tra hệ số Cl theo bảng 4.16
L_l0_table = [0.5 0.6 0.8 1.0 1.2 1.4 1.6 1.8 2.0 2.4];
Cl_table = [0.86 0.89 0.95 1.00 1.04 1.07 1.10 1.13 1.15 1.20];

if L_l0 <= L_l0_table(1)
    Cl = Cl_table(1);
elseif L_l0 >= L_l0_table(end)
    Cl = Cl_table(end);
else
    idx_Cl = find(L_l0_table <= L_l0, 1, 'last');
    Cl = Cl_table(idx_Cl);
end
fprintf('Hệ số chiều dài đai Cl = %.2f\n', Cl);

% Xác định hệ số kể đến ảnh hưởng của tỉ số truyền Cy theo bảng 4.17
u_table = [1 1.2 1.6 1.8 2.2 2.4 3];
Cu_table = [1 1.07 1.11 1.12 1.13 1.135 1.14];

if u <= u_table(1)
    Cu = Cu_table(1);
elseif u > u_table(end)
    Cu = Cu_table(end);
else
    idx_Cu = find(u_table <= u, 1, 'last');
    Cu = Cu_table(idx_Cu);
end
fprintf('Hệ số tỉ số truyền Cu = %.3f\n', Cu);
%Tính hệ số kể đến ảnh hưởng của sự phân bố không đều tải trọng cho các đai:

% Tra bảng 4.19 để xác định P0
% Dữ liệu bảng 4.19 cho l0 = 1700
d1_bang = [112 125 140 160 180];
v_bang = [3 5 10 15 20 25];
P0_bang = [0.70 1.08 1.85 2.40 2.73 2.85;  % 112
    0.78 1.17 2.00 2.75 3.08 3.26;  % 125
    0.80 1.25 2.20 2.92 3.44 3.75;  % 140
    0.84 1.32 2.34 3.14 3.78 4.09;  % 160
    0.88 1.38 2.47 3.37 4.06 4.46]; % 180

% Tìm chỉ số d1 gần nhất nhỏ hơn hoặc bằng d1_chon
idx_d1 = find(d1_bang <= d1_chon, 1, 'last');
if isempty(idx_d1)
    idx_d1 = 1;
end

% Tìm chỉ số vận tốc gần nhất với v
[~, idx_v] = min(abs(v_bang - v));

P0 = P0_bang(idx_d1, idx_v);
fprintf('Công suất cho phép P0 (tra bảng 4.19, l0=1700, d1=%d, v=%.2f m/s) = %.2f kW\n', d1_bang(idx_d1), v_bang(idx_v), P0);

Z_phay = P1 / P0;
fprintf('Z_phay = P1/P0 = %.2f\n', Z_phay);
% Tra hệ số Cz theo bảng 4.18
z_table = [1 2 4 6];
Cz_table = [1 0.95 0.9 0.85];

if Z_phay <= z_table(1)
    Cz = Cz_table(1);
elseif Z_phay <= 3
    Cz = Cz_table(2);
elseif Z_phay <= 5
    Cz = Cz_table(3);
else
    Cz = Cz_table(4);
end
fprintf('Hệ số số đai Cz (tra bảng 4.18, lấy chuẩn) = %.2f\n', Cz);

% Chọn loại tải trọng: 1-tĩnh, 2-dao động nhẹ, 3-dao động mạnh, 4-va đập rất mạnh
loai_tai = 2; % ví dụ: dao động nhẹ
nhom_dong_co = 1; % 1: Nhóm I, 2: Nhóm II

% Bảng Kd gốc
Kd_bang = [1.0 1.1;   % tĩnh
    1.1 1.25;  % dao động nhẹ
    1.25 1.5;  % dao động mạnh
    1.55 1.7]; % va đập rất mạnh

Kd = Kd_bang(loai_tai, nhom_dong_co);

% Cộng thêm hệ số theo số ca làm việc
if ca == 2
    Kd = Kd + 0.1;
elseif ca == 3
    Kd = Kd + 0.2;
end

fprintf('Hệ số tải trọng động Kd (tra bảng 4.7) = %.2f\n', Kd);
%Tính số đai cần thiết
z = P1 * Kd / (P0 * C_alpha * Cl * Cu * Cz);
z_round = ceil(z); % Làm tròn lên số nguyên
fprintf('Số đai cần thiết z = %.2f, làm tròn lên z = %d đai\n', z, z_round);
%1.6: Xác định lực căng ban đầu và lực tác dụng lên trục

% Chọn ký hiệu tiết diện đai: 'O', 'A', 'B', 'YO', 'YA', 'YB'
ky_hieu_dai = 'A';


% Bảng tra t, e, h0, qm
ky_hieu_bang = {'O', 'A', 'Б', 'B', 'YO', 'YA', 'УБ', 'УВ'};
t_bang = [10, 15, 25.5, 10, 15, 26, NaN, NaN]; % Cập nhật nếu có số liệu
e_bang = [8, 10, 17, 8, 10, 17, NaN, NaN];     % Cập nhật nếu có số liệu
h0_bang = [2.5, 3.3, 5.7, 2.5, 3, 5, NaN, NaN];% Cập nhật nếu có số liệu
qm_bang = [0.061, 0.105, 0.178, 0.300, 0.069, 0.118, 0.196, 0.363];

idx_dai = find(strcmp(ky_hieu_bang, ky_hieu_dai));
if isempty(idx_dai)
    error('Không tìm thấy ký hiệu tiết diện đai!');
end

t = t_bang(idx_dai);
e = e_bang(idx_dai);
h0 = h0_bang(idx_dai);
qm = qm_bang(idx_dai);

fprintf('Với đai %s: t = %.1f mm, e = %.1f mm, h0 = %.1f mm, qm = %.3f kg/m\n', ky_hieu_dai, t, e, h0, qm);

%Chiều rộng bánh đai
B = (z_round - 1)*t + 2 * e;
fprintf('Chiều rộng bánh đai B = %.2f mm\n', B);
%Đường kính ngoài bánh đai
d_alpha = d1_chon + 2 * h0;
fprintf('Đường kính ngoài bánh đai dα = %.2f mm\n', d_alpha);
% Chọn d_alpha_chon là giá trị gần nhất trong dãy tiêu chuẩn
d_alpha_standard = [80, 90, 100, 112, 125, 140, 160, 180, 200, 224, 250, 280, 315, 355, 400, 450, 500, 560, 630, 710, 800, 900, 1000, 1120, 1250, 1400, 1600, 1800, 2000, 2240, 2500, 2800, 3150, 3550, 4000]; % mm
[~, idx] = min(abs(d_alpha_standard - d_alpha));
d_alpha_chon = d_alpha_standard(idx);
fprintf('Chọn đường kính ngoài bánh đai tiêu chuẩn gần nhất: dα = %d mm\n', d_alpha_chon);
%1.7: Tính lực tác dụng lên trục
%Lực căng do lực li tâm sinh ra
Fv = qm * v^2;
fprintf('Lực căng do lực li tâm sinh ra Fv = %.2f N\n', Fv);
%Lực căng đai ban đầu
F0 = 780 * P1 * Kd / (v * C_alpha * z_round) + Fv;
fprintf('Lực căng đai ban đầu F0 = %.2f N\n', F0);
%Lực tác dụng lên trục (Fr = 2*F0*z*sin(alpha/2))
Fr = 2 * F0 * z_round * sin((alpha/2) * pi/180);
fprintf('Lực tác dụng lên trục Fr = %.2f N\n', Fr);
