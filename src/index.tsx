/*
 * Copyright 2025 The Kubernetes Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { registerAppBarAction } from '@kinvolk/headlamp-plugin/lib';

// Below are some imports you may want to use.
//   See README.md for links to plugin development documentation.
// import { SectionBox } from '@kinvolk/headlamp-plugin/lib/CommonComponents';
// import { K8s } from '@kinvolk/headlamp-plugin/lib/K8s';
// import { Typography } from '@mui/material';

registerAppBarAction(<span>Hello YAY FROM AKS</span>);

import { AppLogoProps, registerAppLogo } from '@kinvolk/headlamp-plugin/lib';
import { SvgIcon } from '@mui/material';
import AzureLogo from './azure-aks.svg';

function SimpleLogo(props: AppLogoProps) {
  const { className } = props;

  return <SvgIcon className={className} component={AzureLogo} viewBox="0 0 auto 50" height="50" />;
}

registerAppLogo(SimpleLogo);
