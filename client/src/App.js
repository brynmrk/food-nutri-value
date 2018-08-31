import React, { Component } from 'react';
import FoodSearch from './FoodSearch';

class App extends Component {
  state = {
    selectedFoods: [],
  }

  render() {
    return (
      <div className='App'>
        <div className='ui text container'>
          <FoodSearch
            onFoodClick={this.addFood}
          />
        </div>
      </div>
    );
  }
}

export default App;
