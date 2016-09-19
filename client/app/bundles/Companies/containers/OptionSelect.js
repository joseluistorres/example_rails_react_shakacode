import React, { PropTypes } from 'react';

export default class OptionSelect extends React.Component {
  constructor(props, context) {
    super(props, context);
  }

  render() {
    return (
      <option value={this.props.value}>{this.props.label}</option>
    );
  }
}