import { Snippet } from 'https://deno.land/x/tsnip_vim@v0.5/mod.ts';

const state: Snippet = {
  name: 'Snippet of React useState',
  params: [
    {
      name: 'name',
      type: 'single_line',
    },
    {
      name: 'defaultValue',
      type: 'single_line',
    },
    {
      name: 'type',
      type: 'single_line',
    }
  ],
  render: ({ name, defaultValue, type }) =>
    `const [${name?.text ?? ''}, set${
      name != null
        ? `${name.text?.charAt(0).toUpperCase()}${name.text?.slice(1)}`
        : ''
    }] = useState${type != null && type.text !== '' ? `<${type.text}>` : ''}(${defaultValue?.text ?? ''});`,
};

const component: Snippet = {
  name: 'Snippet of react function component',
  params: [
    {
      name: 'componentName',
      type: 'single_line',
    },
    {
      name: 'typeAnnotation',
      type: 'single_line',
    },
  ],
  render: ({ typeAnnotation, componentName }) => {
    const name = componentName?.text === undefined ? 'ComponentName' : `${componentName.text.charAt(0).toUpperCase()}${componentName.text.slice(1)}`;
    return [
      `export const ${name} = ({ ${typeAnnotation?.text?.split(/\s*[,;]\s*/g)?.map(v => v.split(':')[0])?.join(', ') ?? ''} }: { ${typeAnnotation?.text ?? ''} }) => {`,
      '  return (',
      '    <>',
      '    </>',
      '  );',
      '};',
    ].join('\n')
  }
}

export default {
  state, component
};
