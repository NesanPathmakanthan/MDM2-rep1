function [phone, email, letter, radio] = generate_networks(P_phone, P_email, P_letter, P_radio)

P_phone = 1 - P_phone;
P_email = 1 - P_email;
P_letter = 1 - P_letter;
P_radio = 1 - P_radio;

phone = rand(5);
phone = (phone + phone')/2;
phone = phone - diag(diag(phone));
phone(phone >= P_phone) = 1;
phone(phone < P_phone) = 0;

email = rand(5);
email = (email + email')/2; 
email = email - diag(diag(email));
email(email >= P_email) = 1;
email(email < P_email) = 0;

letter = rand(5);
letter = (letter + letter')/2;
letter = letter - diag(diag(letter));
letter(letter >= P_letter) = 1;
letter(letter < P_letter) = 0;

radio = rand(5);
radio = (radio + radio')/2;
radio = radio - diag(diag(radio));
radio(radio >= P_radio) = 1; 
radio(radio <  P_radio) = 0;

% phone
% email
% letter
% radio

% hold on
plot(graph(phone))
% plot(graph(email))
% plot(graph(letter))
% plot(graph(radio))
% hold off
joined_network = cat(3, phone, email, letter, radio)

end