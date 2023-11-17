import React, { ReactElement } from 'react';

const MyView = ({ name, ...props }: any): ReactElement => {
  return <span>Hallo! {name}</span>;
};

export default MyView;
