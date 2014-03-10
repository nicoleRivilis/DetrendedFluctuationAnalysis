function cleanEEG = EEGdenoise(EEG, ECG)
%subtracts ECG signal from EEG and plots results

cleanEEG = EEG-ECG;

subplot(3,1,1)
plot(ECG)
xlim([0 600])
xlabel('N')
ylabel('Scaled ECG (mV)')

subplot(3,1,2)
plot(EEG)
xlim([0 600])
xlabel('N')
ylabel('EEG (mV)')

subplot(3,1,3)
plot(cleanEEG)
xlim([0 600])
xlabel('N')
ylabel('EEG (mV)')