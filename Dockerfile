FROM fedora:latest
#Special Buildflags
ENV CFLAGS "" CXXFLAGS "" LDFLAGS ""

RUN dnf update -y \
&& dnf groupinstall "Development Tools" "RPM Development Tools" \
&& useradd -m /home/rpmbuild rpmbuild

USER rpmbuild

RUN rpmdev-setuptree && cd /home/rpmbuild/rpmbuild/SRPMS
VOLUME [ "/home/rpmbuild/rpmbuild" ]

#TODO: write script to take an input/argument for what srpm to build and fetch builddeps
ENTRYPOINT [ "/bin/bash" ]
