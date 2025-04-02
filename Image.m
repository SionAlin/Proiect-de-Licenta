classdef Image
    properties
        path
        image
    end
    
    methods
        % Constructor
        function obj = Image(Path)
            if nargin == 0 || isequal(Path, "")
                obj.path = "";
                obj.image = [];
            else
                obj.path = Path;
                obj.image = imread(Path);
            end
        end
        
        % Set and update
        function obj = setPath(obj, Path)
            obj.path = Path;
            obj.image = imread(Path);
        end
        
        % Show the image
        function obj = showImage(obj, Axes)
            try
                if ~isempty(obj.image) && (isnumeric(obj.image) || islogical(obj.image))
                    imshow(obj.image, 'Parent', Axes);
                else
                    error('No valid image to display')
                end
            catch Er
                disp('Error: ' + Er.message);
            end
        end
        
        % Relevant methods

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

        function obj = Compression(obj, k)
            img = im2double(obj.image);

            R = img(:,:,1);
            G = img(:,:,2);
            B = img(:,:,3);

            [U_R, S_R, V_R] = svd(R);
            [U_G, S_G, V_G] = svd(G);
            [U_B, S_B, V_B] = svd(B);

            com_R = U_R(:,1:k) * S_R(1:k,1:k) * V_R(:,1:k)';
            com_G = U_G(:,1:k) * S_G(1:k,1:k) * V_G(:,1:k)';
            com_B = U_B(:,1:k) * S_B(1:k,1:k) * V_B(:,1:k)';

            com = cat(3, com_R, com_B, com_G);

            obj.image = com;
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

