# Copyright (c) 2021 Gitpod GmbH. All rights reserved.
# Licensed under the GNU Affero General Public License (AGPL).
# See License.AGPL.txt in the project root for license information.

FROM cgr.dev/chainguard/wolfi-base:latest@sha256:490977f0fd3d8596d173839dbb314153797312553b43f6a24b0e341cf2e8d473
COPY components-installation-telemetry--app/installation-telemetry /app/installation-telemetry
ENTRYPOINT [ "/app/installation-telemetry" ]
CMD [ "help" ]
