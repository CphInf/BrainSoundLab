classdef TwoTones < Block
    
    properties (Transient)
        panels = {'AllChTRF', 'TRF'};
    end
    
    methods
        function stimData = getStimuliConditions(this, source)
            stimData{1} = source.decB.data;
            this.stim(1).label = 'Level, dB';
            
            stimData{2} = source.freq.data/1000; % convert to kHz
            this.stim(2).label = 'Frequency, kHz';
        end
    end
    
    methods (Static)
        function customAnalysis(group, chan)
            process.calcTRF(group, chan);
            process.analyseTRF(group, chan);
        end
    end
end

