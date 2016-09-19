import React, { Component, PropTypes } from 'react';
import OptionSelect from '../containers/OptionSelect';

export default class Users extends Component {
  constructor(props) {
    super(props);
    this.state = {
      users: [],
      company_selected: this.props.company_selected
    }
  }

  componentWillReceiveProps(nextProps) {
    if (nextProps.company_selected != this.props.company_selected) {
      this.loadJSONdata(nextProps.company_selected);
    }
  }

  loadJSONdata(company_selected) {
    $.ajax({
      url: "/companies/" + company_selected + "/users",
      dataType: 'json',
      success: function(data) {
        this.setState({
          users: data
        });
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(company_selected, status, err.toString());
      }.bind(this)
    });
  }

  render () {
    let internalNodes;
    internalNodes = this.state.users.map(function(user, index) {
      return (
        <OptionSelect value={user.id} label={user.username} key={index} />
      );
    });

    return (
      <div className="form-group">
        <select
         onChange={this.props.handleUserSelected}
         className={this.state.users.length >=1 ? "form-control" : "form-control hidden"}>
         <OptionSelect value='' label='' />
         {internalNodes}
        </select>
      </div>
    );
  }
}
