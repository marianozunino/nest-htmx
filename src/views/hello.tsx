import { Html } from '@kitajs/html';

export const MyView = ({ name }: any) => {
  return (
    <Layout>
      <>
        <span safe>Hallo! {name}</span>
        <button hx-post="/" hx-swap="innerHTML" hx-target="#content">
          Click me!
        </button>

        <div id="content">
          <p>Initial content</p>
        </div>
      </>
    </Layout>
  );
};

export const Layout = ({ children }: { children: JSX.Element }) => {
  return (
    <html>
      <head>
        <title>My App</title>
        <script
          src="https://unpkg.com/htmx.org@1.9.8"
          integrity="sha384-rgjA7mptc2ETQqXoYC3/zJvkU7K/aP44Y+z7xQuJiVnB/422P/Ak+F/AqFR7E4Wr"
          crossorigin="anonymous"
        ></script>
      </head>
      <body>
        <h1>My App</h1>
        {children}
      </body>
    </html>
  );
};

export default MyView;
