clear 
choix=1;
true = 1;
while(choix==true)
    n = input ('saisir angle');
    x=[1;2];
    A=[cos(n), -sin(n);sin(n) cos(n)];
    y=A*x;
    disp (y);
    choix= input('calcul angle θ (0 -> non 1->oui)      ');
end
