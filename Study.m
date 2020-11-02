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
            h1Plot = plot3(NaN,NaN,NaN,'ro'); % Hand plot
            hold on
            h2Plot = plot3(NaN,NaN,NaN,'*b'); % Object plot
            axis('equal')
            pbaspect([1 1 1])            
            xlim([-400 800])
            ylim([200 1400])
            zlim([-700 500])
            xlabel('X')
            ylabel('Y')
            zlabel('Z')
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
   end
end