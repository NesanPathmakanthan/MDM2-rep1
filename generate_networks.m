function [joined_network] = generate_networks(P_phone, P_email, P_letter, P_radio)

P_phone = 1 - P_phone;
P_email = 1 - P_email;
P_letter = 1 - P_letter;
P_radio = 1 - P_radio;

selective_nodes = randperm(70,3);
email_only_node = selective_nodes(1);
letter_only_node = selective_nodes(2);
radio_only_node = selective_nodes(3);

phone = zeros(70);
phone1 = rand(25);
phone1 = (phone1 + phone1')/2;
phone1 = phone1 - diag(diag(phone1));
phone2 = rand(45);
phone2 = (phone2 + phone2')/2;
phone2 = phone2 - diag(diag(phone2));
phone(1:25, 1:25) = phone1;
phone(26:70, 26:70) = phone2;
phone(phone >= P_phone) = 1;
phone(phone < P_phone) = 0;
phone(letter_only_node,:) = 0;
phone(:,letter_only_node) = 0;
phone(radio_only_node,:) = 0;
phone(:,radio_only_node) = 0;
phone(email_only_node,:) = 0;
phone(:,email_only_node) = 0;

email = rand(70);
email = (email + email')/2; 
email = email - diag(diag(email));
email(email >= P_email) = 1;
email(email < P_email) = 0;
email(letter_only_node,:) = 0;
email(:,letter_only_node) = 0;
email(radio_only_node,:) = 0;
email(:,radio_only_node) = 0;

letter = rand(70);
letter = (letter + letter')/2;
letter = letter - diag(diag(letter));
letter(letter >= P_letter) = 1;
letter(letter < P_letter) = 0;
letter(email_only_node,:) = 0;
letter(:,email_only_node) = 0;
letter(radio_only_node,:) = 0;
letter(:,radio_only_node) = 0;

radio = rand(70);
radio = (radio + radio')/2;
radio = radio - diag(diag(radio));
radio(radio >= P_radio) = 1; 
radio(radio <  P_radio) = 0;
radio(letter_only_node,:) = 0;
radio(:,letter_only_node) = 0;
radio(email_only_node,:) = 0;
radio(:,email_only_node) = 0;

p = graph(phone);
e = graph(email);
l = graph(letter);
r = graph(radio);


figure;
plot(p, 'XData', rand(numnodes(p), 1), 'YData', rand(numnodes(p), 1), 'ZData', ones(numnodes(p), 1), 'EdgeColor', 'b', 'NodeColor', 'r', 'MarkerSize', 1);
hold on;
plot(e, 'XData', rand(numnodes(e), 1), 'YData', rand(numnodes(e), 1), 'ZData', 2*ones(numnodes(e), 1), 'EdgeColor', 'r', 'NodeColor', 'b', 'MarkerSize', 1);
hold on;
plot(l,'XData', rand(numnodes(l), 1), 'YData', rand(numnodes(l), 1), 'ZData', 3*ones(numnodes(l), 1), 'EdgeColor', 'k', 'NodeColor', 'r','MarkerSize', 1);
hold on;
plot(r, 'XData', rand(numnodes(r), 1), 'YData', rand(numnodes(r), 1), 'ZData', 4*ones(numnodes(r), 1), 'EdgeColor', 'g', 'NodeColor', 'b', 'MarkerSize', 1);
hold off;


title('3D Visualization of Networks');
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
legend('Phone', 'Email', 'Letter', 'Radio')
view(3);  % Set view to 3D

joined_network = cat(3, phone, email, letter, radio);

multiplex_close(phone, email, letter, radio);
multiplex_deg(phone, email, letter, radio);
multiplex_between(phone,email,letter,radio);
multiplex_eigen(phone,email,letter,radio);

end