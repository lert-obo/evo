# This file is part of evo (github.com/MichaelGrupp/evo).
# 
# evo is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# evo is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with evo.  If not, see <http://www.gnu.org/licenses/>.

FROM ros:melodic

# Copy the whole tree into the container.
COPY .ci/debian_install_pip2.sh /tmp/debian_install_pip2.sh

# # In case an image of this container gets executed, source ROS environment.
# # In here, for 'docker build', we have to do it manually.
# ENTRYPOINT ["/src/.ci/ros_entrypoint.sh"]

# Use Python 2.x for ROS.
RUN /tmp/debian_install_pip2.sh
RUN apt install -y python-pyqt5
RUN apt install -y ros-melodic-rviz

# # Build and install.
# Need to manually run when in dev mode
# ENTRYPOINT ["/src/.ci/ros_entrypoint.sh"]
# RUN pip2 install /src --upgrade --no-binary evo
# RUN evo_config set plot_backend Qt5Agg


# # Run tests.
# RUN pip2 install pytest --upgrade
# RUN /src/.ci/ros_run_tests.sh /src
