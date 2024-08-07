function ApplyFigTemplate(fig, ax, ratio )
    if nargin ==2
        ratio = 0.8;
    end
    set(fig,'PaperUnits','inches');
    %pos = get(fig,'paperposition');
    %set(fig, 'papersize', [(pos(3)-pos(1))*0.75, (pos(4)-pos(2))*0.75]);
    width = 3; height = width*ratio;
    %width = 3.8; height = width*0.8;
    set(fig,'papersize',[width,height]);
    set(fig, 'paperposition', [0,0,width,height]);
    %set(ax,'position',[0.19,0.18,0.77,0.77]);
    %set(ax,'position',[0.15,0.18,0.77+0.04,0.75]);
    set(ax,'position',[0.13,0.15,0.84,0.82]);
    %set(ax,'position',[0.17,0.17,0.7,0.7]);
    %set(ax,'position',[0.15,0.15,0.79,0.79]);
    set(ax,'fontsize',12);
end

