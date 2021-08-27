function tangent(action)
%tangent
%   Use the "Start" and "Stop" buttons to control 
%   the tangent.                                


% Possible actions:
% initialize
% close

% Information regarding the play status will be held in
% the axis user data according to the following table:
play= 1;
stop=-1;

if nargin<1,
    action='initialize';
end;

if strcmp(action,'initialize'),
    oldFigNumber=watchon;

    figNumber=figure( ...
        'Name','tangent', ...
        'NumberTitle','off', ...
        'Visible','off');
    colordef(figNumber,'black')
    axes( ...
        'Units','normalized', ...
        'Position',[0.05 0.10 0.75 0.95], ...
        'Visible','off');

    text(0,0,'Press the "Start" button to see tangent', ...
        'HorizontalAlignment','center');
    axis([-1 1 -1 1]);

    %===================================
    % Information for all buttons
    labelColor=[0.8 0.8 0.8];
    yInitPos=0.90;
    xPos=0.85;
    btnLen=0.10;
    btnWid=0.10;
    % Spacing between the button and the next command's label
    spacing=0.05;

    %====================================
    % The CONSOLE frame
    frmBorder=0.02;
    yPos=0.05-frmBorder;
    frmPos=[xPos-frmBorder yPos btnLen+2*frmBorder 0.9+2*frmBorder];
    h=uicontrol( ...
        'Style','frame', ...
        'Units','normalized', ...
        'Position',frmPos, ...
        'BackgroundColor',[0.50 0.50 0.50]);
    
    %====================================
    % The START button
    btnNumber=1;
    yPos=0.90-(btnNumber-1)*(btnWid+spacing);
    labelStr='Start';
    cmdStr='start';
    callbackStr='tangent(''start'');';

    % Generic button information
    btnPos=[xPos yPos-spacing btnLen btnWid];
    startHndl=uicontrol( ...
        'Style','pushbutton', ...
        'Units','normalized', ...
        'Position',btnPos, ...
        'String',labelStr, ...
        'Interruptible','on', ...
        'Callback',callbackStr);

    %====================================
    % The STOP button
    btnNumber=2;
    yPos=0.90-(btnNumber-1)*(btnWid+spacing);
    labelStr='Stop';
    % Setting userdata to -1 (=stop) will stop the demo.
    callbackStr='set(gca,''Userdata'',-1)';
    
    % Generic  button information
    btnPos=[xPos yPos-spacing btnLen btnWid];
    stopHndl=uicontrol( ...
        'Style','pushbutton', ...
        'Units','normalized', ...
        'Position',btnPos, ...
        'Enable','off', ...
        'String',labelStr, ...
        'Callback',callbackStr);

    %====================================
    % The 
    
    btnNumber=3;
    yPos=0.90-(btnNumber-1)*(btnWid+spacing);
    
    
    % Generic  button information
    btnPos=[xPos yPos-spacing btnLen btnWid];
    %fHndl=uicontrol('style','text','string','f = ','pos',btnPos,...
    %'tag','fobj','UserData',fs);

    %====================================
    % The INFO button
    labelStr='Info';
    callbackStr='tangent(''info'')';
    infoHndl=uicontrol( ...
        'Style','push', ...
        'Units','normalized', ...
        'position',[xPos 0.20 btnLen 0.10], ...
        'string',labelStr, ...
        'call',callbackStr);

    %====================================
    % The CLOSE button
    labelStr='Close';
    callbackStr='close(gcf)';
    closeHndl=uicontrol( ...
        'Style','push', ...
        'Units','normalized', ...
        'position',[xPos 0.05 btnLen 0.10], ...
        'string',labelStr, ...
        'call',callbackStr);
    
    % Uncover the figure
    hndlList=[startHndl stopHndl infoHndl closeHndl];
    set(figNumber,'Visible','on', ...
        'UserData',hndlList);

    watchoff(oldFigNumber);
    figure(figNumber);

elseif strcmp(action,'start'),
    axHndl=gca;
    figNumber=gcf;
    hndlList=get(figNumber,'UserData');
    startHndl=hndlList(1);
    stopHndl=hndlList(2);
    infoHndl=hndlList(3);
    closeHndl=hndlList(4);
    set([startHndl closeHndl infoHndl],'Enable','off');
    set(stopHndl,'Enable','on');

    % ====== Start of Demo
    syms x;
    f0=x^2;
    df0=diff(f0);
    fs=char(f0);
    global f df
    f=inline(fs);
    df=inline(char(df0));
    t0=-10;tfinal=10;
    h=(tfinal-t0)/100;
    t=t0:h:tfinal;
    for i=1:length(t),
       Y(i)=f(t(i));
    end
    ymax=max(Y);
    ymin=min(Y);
    set(figNumber,'Backingstore','off');
    % The graphics axis limits are set to values known 
    % to contain the solution.
    set(axHndl, ...
        'XLim',[t0 tfinal],'YLim',[ymin ymax], ...
        'Userdata',play, ...
        'XTick',[],'YTick',[], ...
        'Drawmode','fast', ...
        'Visible','on', ...
        'NextPlot','add', ...
        'Userdata',play);
    xlabel('X');
    ylabel('Y');
    plot(t,Y);

    
    FunFcn='tf';
    FunFcn2='tdf';
    
    y0=feval(FunFcn,t0);
    dy0=feval(FunFcn,t0);
    
 
    t=t0;
    y=y0;
    dy=[dy0;feval(FunFcn2,t,t+10*h)];
    
 
    % Save L steps and plot like a comet tail.
    L = 2;
    Y = y*ones(1,L);
    dY = dy;
 
    cla;
    head = line( ...
        'color','r', ...
        'Marker','.', ...
        'markersize',25, ...
        'erase','xor', ...
        'xdata',y(1),'ydata',y(2));
    body = line( ...
        'color','y', ...
        'LineStyle','-', ...
        'erase','xor', ...
        'xdata',[],'ydata',[]);
    tail=line( ...
        'color','b', ...
        'LineStyle','-', ...
        'erase','none', ...
        'xdata',[],'ydata',[]);
     
    % The main loop
    while (get(axHndl,'Userdata')==play)&(t<tfinal)
 
 
        % Update the solution only if the error is acceptable
            t = t + h;
            y = feval(FunFcn,t);
            dy = [feval(FunFcn2,t,t-10*h);feval(FunFcn2,t,t+10*h)];
 
            % Update the plot
            Y = [y Y(:,1:L-1)];
            dY = dy;
            set(head,'xdata',Y(1,1),'ydata',Y(2,1))
            set(body,'xdata',[dY(1,1),dY(3,1)],...
               'ydata',[dY(2,1),dY(4,1)])
            set(tail,'xdata',Y(1,1:2),'ydata',Y(2,1:2))
            drawnow;
 

    end;    % Main loop ...
    % ====== End of Demo
    set([startHndl closeHndl infoHndl],'Enable','on');
    set(stopHndl,'Enable','off');

elseif strcmp(action,'info');
    helpwin(mfilename);

end;    % if strcmp(action, ...

function ydot = tf(t)

global f
ydot = [t;feval(f,t)];

function dy = tdf(t0,t)

global f df

dy =[t;feval(f,t0)+feval(df,t0)*(t-t0)];