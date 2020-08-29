%% Placeholder graph

function placeHolderPlot(plotname)

close all

if nargin < 1
   plotname = 'Sample';
end

figure
axis([0 1 0 1])
text(0.1,0.35,'Place Holder','fontsize',40,'color','blue')
text(0.1,0.65,plotname,'fontsize',40,'color','blue')
print('-dpng',[plotname '.png'])
