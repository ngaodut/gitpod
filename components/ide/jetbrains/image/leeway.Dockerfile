# Copyright (c) 2021 Gitpod GmbH. All rights reserved.
# Licensed under the GNU Affero General Public License (AGPL).
# See License.AGPL.txt in the project root for license information.

FROM cgr.dev/chainguard/wolfi-base:latest@sha256:490977f0fd3d8596d173839dbb314153797312553b43f6a24b0e341cf2e8d473 as base_builder
RUN mkdir /ide-desktop

# for debugging
# FROM cgr.dev/chainguard/wolfi-base:latest@sha256:490977f0fd3d8596d173839dbb314153797312553b43f6a24b0e341cf2e8d473
FROM scratch
ARG JETBRAINS_DOWNLOAD_QUALIFIER
ARG JETBRAINS_BACKEND_QUALIFIER
ARG JETBRAINS_BACKEND_VERSION
ARG SUPERVISOR_IDE_CONFIG
# ensures right permissions for /ide-desktop
COPY --from=base_builder --chown=33333:33333 /ide-desktop/ /ide-desktop/
COPY --chown=33333:33333 ${SUPERVISOR_IDE_CONFIG} /ide-desktop/supervisor-ide-config.json
COPY --chown=33333:33333 components-ide-jetbrains-image--download-${JETBRAINS_DOWNLOAD_QUALIFIER}/backend /ide-desktop/${JETBRAINS_DOWNLOAD_QUALIFIER}/backend
COPY --chown=33333:33333 components-ide-jetbrains-cli--app/cli /ide-desktop/${JETBRAINS_DOWNLOAD_QUALIFIER}/bin/idea-cli

LABEL "io.gitpod.ide.version"=$JETBRAINS_BACKEND_VERSION
