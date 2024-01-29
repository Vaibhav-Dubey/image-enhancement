clc;

I = imread("airplane_grayscale.png");
imshow(I);

I = double(I); 
  
 
filtered_image1 = zeros(size(I)); 
filtered_image2 = zeros(size(I)); 
filtered_image3 = zeros(size(I)); 
filtered_image4 = zeros(size(I)); 
filtered_image5 = zeros(size(I)); 
  
% Robert Operator Mask 
Hx = [1 0; 0 -1]; 
Hy = [0 1; -1 0];   

for i = 1:size(I, 1) - 1 
    for j = 1:size(I, 2) - 1 
  
        % Gradient approximations 
        Gx = sum(sum(Hx.*I(i:i+1, j:j+1))); 
        Gy = sum(sum(Hy.*I(i:i+1, j:j+1))); 
                 
        % Calculate magnitude of vector 
        filtered_image1(i, j) = sqrt(Gx.^2 + Gy.^2); 
        if filtered_image1(i,j) >=25
            filtered_image2(i,j) = filtered_image1(i,j);
            filtered_image3(i,j) = 255;
            filtered_image4(i,j) = filtered_image1(i,j);
            filtered_image5(i,j) = 255;
        else 
            filtered_image2(i,j) = I(i,j);
            filtered_image3(i,j) = I(i,j);
            filtered_image4(i,j) = 0;
            filtered_image5(i,j) = 0;
        end
                
         
    end
end
  

% Displaying Filtered Image 
filtered_image1 = uint8(filtered_image1); 
figure, imshow(filtered_image1); title('Filtered Image case 1');
filtered_image2 = uint8(filtered_image2); 
figure, imshow(filtered_image2); title('Filtered Image case 2');
filtered_image3 = uint8(filtered_image3); 
figure, imshow(filtered_image3); title('Filtered Image case 3');
filtered_image4 = uint8(filtered_image4); 
figure, imshow(filtered_image4); title('Filtered Image case 4');
filtered_image5 = uint8(filtered_image5); 
figure, imshow(filtered_image5); title('Filtered Image case 5');