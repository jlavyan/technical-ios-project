platform :ios, '13.0'

use_frameworks!


#Twitch sample app target
target 'Twitch' do
    pod 'RxSwift', '~> 5'
    pod 'RxCocoa', '~> 5'
    pod 'SwiftTwitch'
end


#Test targets
def testing_pods
    pod 'RxBlocking', '~> 5'
    pod 'RxTest', '~> 5'
end

target 'TwitchTests' do
    testing_pods 
end

target 'TwitchUITests' do
    testing_pods 
end
