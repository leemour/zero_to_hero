import thunkMiddleware from 'redux-thunk'
import { createStore, applyMiddleware } from 'redux'
import { composeWithDevTools } from 'redux-devtools-extension'

import mainReducer from './reducers'

const store = createStore(
  mainReducer,
  composeWithDevTools(applyMiddleware(thunkMiddleware)),
)

export default store
