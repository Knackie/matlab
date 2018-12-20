% 1) Signal sinusoidal amorti
f1=10;      % fréquences des 2 sinusoïdes
f2=190;
alpha=2;    % amortissement
fe=400;     % fréquence d'échantillonnage
Te=1/fe;    % période d'échantillonnage

t=0:Te:2;   % axe des temps et signal
x=exp(-alpha*t).*cos(2*pi*f1*t) + exp(-alpha*t).*cos(2*pi*f2*t);

N=length(x);    % taille du x: N = 801

% 2) Bruit blanc
b=0;
for i=1:10
    e=randn(size(x));   % bruit blanc gaussien
    e=(e-mean(e))/std(e); % bruit blanc centré réduit
    b=b+sqrt(20)*e;
end
b=b/10;

xb=x+b; % signal avec bruit

% 3) Sinusoïde pure
y=cos(2*pi*10*t);

% 4) Tracé des 3 signaux
figure(1); plot(t, xb, t, x, t, y);
xlabel('temps'); ylabel('amplitude');
legend('signal bruité xb','signal sans bruit x','sinusoïde y');

% 5) Calcul de la convolution
z=conv(xb, y);   % produit de convolution entre xb et y
Nz=length(z);    % la longueur de z est Nz = 2*N-1 = 1601

% 6) Calcul de l'intercorrélation
r=xcorr(xb, y); % intercorrélation entre xb et y
% r est pseudo-périodique de fréquence 10 Hz
% z est égal à r car la fonction d'intercorrélation peut être calculée par
% un produit de convolution entre xb et y (noter que y est un signal pair)

% 7) Axe des temps pour les signaux z et r
tz=(0:1:Nz-1)*Te;
% tz=linspace(0,Nz-1,Nz)*Te;    % autre façon de générer tz

% 8) Tracé de la convolution et de l'intercorrélation
figure(2);
plot(tz, z, tz, r); xlabel('temps'); ylabel('amplitude');
legend('convolution entre xb et y', 'intercorrélation entre xb et y');
