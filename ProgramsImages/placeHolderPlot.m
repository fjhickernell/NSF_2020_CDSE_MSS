%% Placeholder graph

function placeHolderPlot(plotname)

close all

figure
axis([0 1 0 1])
text(0.1,0.35,'Place Holder','fontsize',40)
text(0.1,0.65,plotname,'fontsize',40)
print('-dpng',[plotname '.png'])
