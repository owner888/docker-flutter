FROM --platform=linux/amd64 ubuntu:22.04 as builder
RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-17-jdk wget
RUN useradd -ms /bin/bash user
USER user
WORKDIR /home/user

# Installing Android SDK
RUN mkdir -p Android/sdk/cmdline-tools
ENV ANDROID_SDK_ROOT /home/user/Android/sdk
RUN mkdir -p .android && touch .android/repositories.cfg
# https://developer.android.com/studio#cmdline-tools
RUN wget -O cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
RUN unzip cmdline-tools.zip && rm cmdline-tools.zip
RUN mv cmdline-tools Android/sdk/cmdline-tools/latest
RUN cd Android/sdk/tools/bin && yes | ./sdkmanager --licenses
RUN cd Android/sdk/tools/bin && ./sdkmanager "build-tools;29.0.2" "patcher;v4" "platform-tools" "platforms;android-29" "sources;android-29"
ENV PATH "$PATH:/home/user/Android/sdk/platform-tools"

# Installing Flutter SDK
RUN git clone https://github.com/flutter/flutter.git
ENV PATH "$PATH:/home/user/flutter/bin"
RUN flutter channel stable
RUN flutter upgrade
RUN flutter doctor
