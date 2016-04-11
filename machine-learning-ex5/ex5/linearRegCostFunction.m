function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
%X = [ones(m,1) X];
h = X*theta;

J = sum((h - y).^2)/(2*m);
theta_temp = theta.^2;
J = J + (sum(theta_temp(2:end))*lambda)*(1/(2*m));

grad = (X'*(h-y))/m + (theta*lambda)*(1/m);
grad(1) = (X(:,1)'*(h-y))*(1/m);


% =========================================================================

grad = grad(:);

end