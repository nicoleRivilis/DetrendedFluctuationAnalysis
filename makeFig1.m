function makeFig1(lengthseries)
%designed to reproduce figure 1 in DFA paper

%create 3 types of noise with known scaling exponents
whiteN = randn(1,lengthseries);
whiteN = whiteN./max(abs(whiteN)); %to normalize
pinkN = pinkNoise(lengthseries);
brownN = brownNoise(lengthseries);

[expWhite, LW, FW] = DFA(whiteN);
[expPink, LP, FP] = DFA(pinkN);
[expBrown, LB, FB] = DFA(brownN);

subplot(3,2,1)
plot(whiteN)
ylabel('White Noise')

subplot(3,2,3)
plot(pinkN)
ylabel('Pink Noise')

subplot(3,2,5)
plot(brownN)
ylabel('Brown Noise')

subplot(3,2,2)
plot(log(LW), log(FW), 'o:')
xlabel('Log n')
ylabel('Log F(n)')
texstringW = texlabel(['alpha = ' num2str(expWhite)]);
legend(texstringW, 'Location', 'SouthEast')

subplot(3,2,4)
plot(log(LP), log(FP), 'o:')
xlabel('Log n')
ylabel('Log F(n)')
texstringP = texlabel(['alpha = ' num2str(expPink)]);
legend(texstringP, 'Location', 'SouthEast')

subplot(3,2,6)
plot(log(LB), log(FB), 'o:')
xlabel('Log n')
ylabel('Log F(n)')
texstringB = texlabel(['alpha = ' num2str(expBrown)]);
legend(texstringB, 'Location', 'SouthEast')

end