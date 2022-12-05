%%% Computing Quantiles

%% Set-Up
format long
close all %close all figures
set(0,'defaultaxesfontsize',18,'defaulttextfontsize',18, ... %make font larger
      'defaultLineLineWidth',3, ... %thick lines
      'defaultLineMarkerSize',40) %big dots
LatexInterpreter %LaTeX interpreted axis labels, tick labels, and legends

%% Plotting empirical distribution function
f = {@(x) cos(pi*x), @(x) cos(100*pi*x)};
ftitle = ["\(Y = f(X) = \cos(\pi X)\)";"\(Y = f(X) = \cos(100\pi X)\)"];
F = @(y) asin(y)/pi + 1/2;
Ftitle = "\(F_Y(y) = \sin^{-1}(y)/\pi + 1/2\)";
n = 2^6;
probval = ((0:n-1)+1/2)/n;
quantval = [0.1 0.5 0.75];
nq = length(quantval);
rep = 100;
tsp = 1/rep;
lw = 3;

rng(47)
xnet(n,rep) = 0;
for i = 1:rep
   xnet(:,i) = net(scramble(sobolset(1),"MatousekAffineOwen"),n);
end

xplot = (0:0.002:1);
yplot = 2*xplot - 1;

nrows = 3;
for j = 1:2
   k = 0;
   
   fplot = f{j}(xplot);
   subplot(nrows,2,k+j)
   plot(xplot,fplot,'Color',MATLABBlue,'LineWidth',lw)
   xlabel("\(x\)")
   ylabel("\(f(x)\)")
   title(ftitle(j,:))
   k = k + 2;
   
%    Fplot = F(yplot);
%    subplot(4,2,k+j)
%    plot(yplot,Fplot)
%    xlabel("\(y\)")
%    ylabel("\(F_Y(y)\)")
%    title(Ftitle)
%    k = k + 2;

   xiid = rand(n,rep);
   fiid = sort(f{j}(xiid),1);
   qiid = quantile(fiid,quantval,1);
   subplot(nrows,2,k+j)
   for ii = 1:rep
      hold on
      plot(fiid(:,ii),probval,'Color',[MATLABBlue tsp],'LineWidth',lw);
   end
   xlabel("\(y\)")
   ylabel("\(F_{\mathrm{emp}}(y)\)")
   title('IID')
   k = k + 2;

   fnet = sort(f{j}(xnet),1);
   qnet = quantile(fnet,quantval,1);
   subplot(nrows,2,k+j)
   hold on
   for ii = 1:rep
      plot(fnet(:,ii),probval,'Color',[MATLABBlue tsp],'LineWidth',lw)
   end
   xlabel("\(y\)")
   ylabel("\(F_{\mathrm{emp}}(y)\)")
   title('LD')
end


print('distribExper.eps','-depsc')
print('distribExper.pdf','-dpdf')
exportgraphics(gcf,'distribExperEG.pdf')



