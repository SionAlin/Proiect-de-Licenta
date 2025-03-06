classdef Image
    properties
        image
    end
    
    methods
        function obj = Image(Path)
            %Constructor
            obj.image = imread(Path);
        end
        
        function obj = Flip(obj, Direction)
            switch lower(Direction)
                case "horizontal"
                    obj.image = obj.image(1:end, end:-1:1, 1:3);
                case "vertical"
                    obj.image = obj.image(end:-1:1, 1:end, 1:3); 
                otherwise
                    error("Direction can be horizontal or vertical");
            end
        end
        
        % Obj 1:

        function obj = Stack(obj1, obj2, direction)
        end

        function obj = Zoom(obj, percentage)
        end
        
        function obj = CropToShape(obj, shape)
        end
        
        %{ Color correction and tone adjustment
        %   Color Spaces
        %   Histogram
        
        function obj = Brightness(obj, percentage)
        end

        function obj = Contrast(obj, percentage)
        end
        
        %}

        function obj = Compression(obj, type)
            % type -> Lossy or Lossless
        end
        
        function obj = FadeOut(obj, percentage)
        end
        
        % Obj 2:

        function obj = GeometricTransformations(obj, angle, scale)
        end

        function obj = KernelConvolution(obj, blur_percentage, sharpen_percentage)
        end

        function obj = BezierCurve(obj, P0, P1, P2)
        end
        
        function obj = Interpolation(obj, new_size ,type)
            % type -> Nearest Neighbor or Bilinear or Bicubic 
        end

        function obj = Sampling(obj, new_size ,type)
            % type -> Oversampling or Subsampling
        end
        
        function obj = EdgeDetection(obj)
        end

        function obj = FourierTransform(obj)
        end

    end
end

