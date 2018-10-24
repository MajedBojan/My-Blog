import ReactOnRails from 'react-on-rails';
import TestReact from '../bundles/TestReact/components/test_react';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  TestReact,
});
