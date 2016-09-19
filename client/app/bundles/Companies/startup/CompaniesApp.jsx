import React from 'react';
import ReactOnRails from 'react-on-rails';

import Companies from '../containers/Companies';

const CompaniesApp = (props) => (
  <Companies companies={props} />
);

// This is how react_on_rails can see the HelloWorldApp in the browser.
ReactOnRails.register({ CompaniesApp });
