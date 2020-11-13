# Copyright 2020 Security Scorecard Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
FROM golang
COPY . /go/src/github.com/ossf/scorecard
WORKDIR /go/src/github.com/ossf/scorecard
RUN [ "go", "build", "."]

FROM gcr.io/cloud-builders/gsutil
WORKDIR /go/src/github.com/ossf/scorecard
COPY --from=0 /go/src/github.com/ossf/scorecard /go/src/github.com/ossf/scorecard
ENTRYPOINT [ "./scorecard" ]
