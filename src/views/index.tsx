import React from 'react';

export default function MyComponent() {
  const [counter, setCounter] = React.useState(0);
  return (
    <html>
      <head>
        <script
          src="https://unpkg.com/htmx.org@1.9.8"
          integrity="sha384-rgjA7mptc2ETQqXoYC3/zJvkU7K/aP44Y+z7xQuJiVnB/422P/Ak+F/AqFR7E4Wr"
          crossOrigin="anonymous"
        ></script>
      </head>
      <form hx-post="/hello">
        <input name="name" />
        <button>Submit</button>
      </form>

      <button onClick={() => setCounter(counter + 1)}>Click me</button>

      <span>{counter}</span>
    </html>
  );
}
