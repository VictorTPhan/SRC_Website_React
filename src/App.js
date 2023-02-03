import ReactHeader from './components/ReactHeader'
import MainHeader from './components/MainHeader.jsx'
import DocEntries from './components/DocEntries';
import './App.css';

function App() {
  return (
    <div className="App">
      <ReactHeader></ReactHeader>
      <h1>Socially Responsible Computing</h1>
      <MainHeader></MainHeader>
      <DocEntries></DocEntries>
    </div>
  )
}

export default App;
