%%Plot of QMC Software

close all
gail.InitializeDisplay

% Software, User Base, Scope
QMCSoftE = {
    "SciPy/PyTorch", 1, 0.4
    "MATLAB",0.97, 0.25
    "NAG",0.97, 0.2
    "qrng",0.1,0.2
    "BRODA",0.2,0.3
    "MPS/QMC4PDE",0.2,0.5
    "LatNet/SSJ",0.5,0.8
    "UQLab",0.55,0.1
};
SoftNames = QMCSoftE(:,1);
SoftUser = cell2mat(QMCSoftE(:,2));
SoftScope = cell2mat(QMCSoftE(:,3));

plot(SoftUser,SoftScope,'.','markerSize',50,'color',MATLABBlue)
axis([0 1.4 0 1])
xlabel("Library Scope")
ylabel("QMC Scope")
set(gca,'xtick',[],'ytick',[])
labelpoints(SoftUser,SoftScope,SoftNames,"E",0.2,0,'FontSize',16)
hold on
QMCSoftW = {    
    "QMCPy", 0.4, 0.8
    "CUDA",0.85, 0.25
    "TensorFlow", 0.95, 0.4
    "GAIL",0.3 0.7
    "OpenTURNS",0.45,0.1
};
SoftNames = QMCSoftW(:,1);
SoftUser = cell2mat(QMCSoftW(:,2));
SoftScope = cell2mat(QMCSoftW(:,3));
plot(SoftUser,SoftScope,'.','markerSize',50,'color',MATLABBlue)
labelpoints(SoftUser,SoftScope,SoftNames,"W",0.2,0,'FontSize',16)

% quiver(0.9,0.65,0.25,0.25,...
%     'LineWidth',6,'color',MATLABOrange,'AutoScale','off', ...
%     'maxheadsize',1.5)
%quiver([0.85;1],[0.8;0.65],[0.3;0.2],[0.2;0.35],...
%    'LineWidth',4,'color',MATLABOrange,'AutoScale','off')

print('-depsc','QMCSoftwarePlot.eps')