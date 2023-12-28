import { Snippet } from 'https://deno.land/x/tsnip_vim@v0.5/mod.ts';

const struct: Snippet = {
  name: 'generate derive',
  params: [
    {
      name: 'name',
      type: 'single_line',
    },
    {
      name: 'traits',
      type: 'multi_line',
    },
  ],
  render: (inputs, ctx) => {
    const traits = inputs.traits?.text?.split(/\n/) ?? [];
    const name = inputs.name?.text ?? '...';
    
    const derives = traits.flatMap(v => {
      if (v === 'dbg') return [ 'Debug' ];
      if (v === 'cln') return [ 'Clone' ];
      if (v === 'disp') return [ 'Display' ];
      if (v === 'serde') return [ 'Serialize', 'Deserialize' ];
      return [v];
    });

    return [
      ...(derives.length > 0 ? [`#[derive(${derives.join(', ')})]`] : []),
      `struct ${name} {`,
      `  ${ctx.postCursor}`,
      `}`,
    ].join('\n');
  } 
}

export default {
  struct
};
