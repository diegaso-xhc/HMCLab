classdef Study
    properties
        subjects % These are the subjects belonging to this study
        path % Path of the information
        name % Name of the trial for the study
        n_smp % Number of samples during the study
    end
    methods
        function obj = Study(t1, t2)
            % t1 and t2 are the times of interest of the trial
            if nargin == 0
                [subjects, path, name, n_smp] = get_info_trial();
            else
                [subjects, path, name, n_smp] = get_info_trial(t1, t2);
            end
            obj.subjects = subjects; % Subjects of the study
            obj.path = path; % Path of the file
            obj.name = name; % Name of the trial
            obj.n_smp = n_smp; % Number of samples
        end        
        function plot_mk(obj, sub, mk, hld)
            tmp = ['X', 'Y', 'Z'];
            for i = 1: 3
                subplot(3, 1, i)
                plot(obj.subjects{sub}.markers{mk}.traj(:, i), 'r')
                if hld == 1
                    hold on
                else
                    hold off
                end
                xlabel('Sample')
                ylabel(tmp(i))
                grid on
            end
        end
        function plot_traj(obj)            
            figure;
            h1Plot = plot3(NaN,NaN,NaN,'.r'); % Hand plot
            hold on
            h2Plot = plot3(NaN,NaN,NaN,'.b'); % Object plot
            axis('equal')
            pbaspect([1 1 1])            
            xlim([-400 800])
            ylim([200 1400])
            zlim([-700 500])
            xlabel('X')
            ylabel('Y')
            zlabel('Z')
            str = strcat('Trial:', '  ', obj.name(end-2: end));
            title(str)
            grid on
            ls = length(obj.subjects); % Number of subjects
            for t = 1: obj.n_smp
                for i = 1: ls
                    X = obj.subjects{i}.traj_mat(t, 1:3:end)';
                    Y = obj.subjects{i}.traj_mat(t, 2:3:end)';
                    Z = obj.subjects{i}.traj_mat(t, 3:3:end)';
                    if i == 1                        
                        set(h1Plot,'XData',X,'YData',Y, 'ZData', Z);
                        hold on
                    else                        
                        set(h2Plot,'XData',X,'YData',Y, 'ZData', Z);
                        hold off
                    end
                    pause(0.001)
                end
            end
        end
        function plot_traj_ax(obj, n, sc_f)            
            % sc_f is a scaling factor for the reference frame axes
            % sub is the subject for this plot
            fig1 = figure;
            h1Plot = plot3(NaN,NaN,NaN,'.r'); % Hand plot
            hold on
            h2Plot = plot3(NaN,NaN,NaN,'.b'); % Object plot
            h3Plot_ax = quiver3(NaN,NaN,NaN,NaN,NaN,NaN, 'c');
%             h3PlotX_ax = quiver3(NaN,NaN,NaN,NaN,NaN,NaN, 'b');
%             h3PlotY_ax = quiver3(NaN,NaN,NaN,NaN,NaN,NaN, 'g');
%             h3PlotZ_ax = quiver3(NaN,NaN,NaN,NaN,NaN,NaN, 'c');
            axis('equal')
            pbaspect([1 1 1])            
            xlim([0 600])
            ylim([100 1000])
            zlim([-20 450])
            xlabel('X')
            ylabel('Y')
            zlabel('Z')
%             str = strcat('Trial:', '  ', obj.name(end-2: end));
%             title(str)
            title('Complex Object Manipulation')
            view(25, 35);            
            set(fig1,'Position',[250 250 950 600])

            grid on
            ls = length(obj.subjects); % Number of subjects            
            obj.subjects{n}.ax(4: 12, :) = obj.subjects{n}.ax(4: 12, :)*sc_f;
            for t = 1: obj.n_smp
                for i = 1: ls
                    X = obj.subjects{i}.traj_mat(t, 1:3:end)';
                    Y = obj.subjects{i}.traj_mat(t, 2:3:end)';
                    Z = obj.subjects{i}.traj_mat(t, 3:3:end)';                    
                    if i == n                        
                        set(h1Plot,'XData',X,'YData',Y,'ZData',Z);  
                        ax_o = obj.subjects{i}.ax(1: 3, t);
                        ax_x = obj.subjects{i}.ax(4: 6, t);
                        ax_y = obj.subjects{i}.ax(7: 9, t);
                        ax_z = obj.subjects{i}.ax(10: 12, t);                        
                        set(h3Plot_ax, 'XData', [ax_o(1) ax_o(1) ax_o(1)], 'YData', [ax_o(2) ax_o(2) ax_o(2)], 'ZData', [ax_o(3) ax_o(3) ax_o(3)],...
                            'UData', [ax_x(1), ax_y(1), ax_z(1)], 'VData', [ax_x(2), ax_y(2), ax_z(2)], 'WData', [ax_x(3), ax_y(3), ax_z(3)]);                        
%                         set(h3PlotX_ax, 'XData', ax_o(1), 'YData', ax_o(2), 'ZData', ax_o(3), 'UData', ax_x(1), 'VData', ax_x(2), 'WData', ax_x(3));
%                         set(h3PlotY_ax, 'XData', ax_o(1), 'YData', ax_o(2), 'ZData', ax_o(3), 'UData', ax_y(1), 'VData', ax_y(2), 'WData', ax_y(3));
%                         set(h3PlotZ_ax, 'XData', ax_o(1), 'YData', ax_o(2), 'ZData', ax_o(3), 'UData', ax_z(1), 'VData', ax_z(2), 'WData', ax_z(3));
                        hold on
                    else                        
                        set(h2Plot,'XData',X,'YData',Y, 'ZData', Z);
                        hold off
                    end
                    pause(0.000001)
                end
            end
        end
        function plot_snapshot_ax(obj, n, sc_f, in_smp, end_smp)            
            % sc_f is a scaling factor for the reference frame axes
            % sub is the subject for this plot
            % in_smp and end_smp are the initial and last samples of the
            % period of interest, respectively.
            fig1 = figure;
            h1Plot = plot3(NaN,NaN,NaN,'.r'); % Hand plot
            hold on
            h2Plot = plot3(NaN,NaN,NaN,'.b'); % Object plot
            h3PlotX_ax = quiver3(NaN,NaN,NaN,NaN,NaN,NaN, 'c');
            h3PlotY_ax = quiver3(NaN,NaN,NaN,NaN,NaN,NaN, 'g');
            h3PlotZ_ax = quiver3(NaN,NaN,NaN,NaN,NaN,NaN, 'b');
            axis('equal')
            pbaspect([1 1 1])            
            xlim([0 600])
            ylim([100 1000])
            zlim([-20 450])
            xlabel('X')
            ylabel('Y')
            zlabel('Z')
%             str = strcat('Trial:', '  ', obj.name(end-2: end));
%             title(str)
            title('Complex Object Manipulation')
            view(25, 35);            
            set(fig1,'Position',[250 250 950 600])

            grid on
            ls = length(obj.subjects); % Number of subjects            
            obj.subjects{n}.ax(4: 12, :) = obj.subjects{n}.ax(4: 12, :)*sc_f;
            for t = in_smp: end_smp
                for i = 1: ls
                    X = obj.subjects{i}.traj_mat(t, 1:3:end)';
                    Y = obj.subjects{i}.traj_mat(t, 2:3:end)';
                    Z = obj.subjects{i}.traj_mat(t, 3:3:end)';                    
                    if i == n                        
                        set(h1Plot,'XData',X,'YData',Y,'ZData',Z);  
                        ax_o = obj.subjects{i}.ax(1: 3, t);
                        ax_x = obj.subjects{i}.ax(4: 6, t);
                        ax_y = obj.subjects{i}.ax(7: 9, t);
                        ax_z = obj.subjects{i}.ax(10: 12, t);                                             
                        set(h3PlotX_ax, 'XData', ax_o(1), 'YData', ax_o(2), 'ZData', ax_o(3), 'UData', ax_x(1), 'VData', ax_x(2), 'WData', ax_x(3));
                        set(h3PlotY_ax, 'XData', ax_o(1), 'YData', ax_o(2), 'ZData', ax_o(3), 'UData', ax_y(1), 'VData', ax_y(2), 'WData', ax_y(3));
                        set(h3PlotZ_ax, 'XData', ax_o(1), 'YData', ax_o(2), 'ZData', ax_o(3), 'UData', ax_z(1), 'VData', ax_z(2), 'WData', ax_z(3));
                        hold on
                    else                        
                        set(h2Plot,'XData',X,'YData',Y, 'ZData', Z);
                        hold off
                    end
                    pause(0.000001)
                end
            end
        end
   end
end