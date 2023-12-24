import json from "@rollup/plugin-json";
import resolve from "@rollup/plugin-node-resolve";
import commonjs from "@rollup/plugin-commonjs";
import typescript from "@rollup/plugin-typescript";
import dts from "rollup-plugin-dts";
// import terser from '@rollup/plugin-terser';

import postcss from "rollup-plugin-postcss";

import packageJson from "./package.json" assert { type: 'json' };

export default [
  {
    input: "src/index.ts",
    output: [
      {
        file: packageJson.main,
        format: "cjs",
        sourcemap: true,
      },
      {
        file: packageJson.module,
        format: "esm",
        sourcemap: true,
      },
      // {
      //   file: 'dist/min/bundle.min.js',
      //   format: 'iife',
      //   name: 'version',
      //   plugins: [terser()]
      // },
    ],
    plugins: [
      resolve(),
      commonjs(),
      typescript({ tsconfig: "./tsconfig.json", exclude: ["**/*.stories.tsx", "**/*.test.tsx"] }),
      postcss(),
      json(),
    ]
  },
  {
    input: "dist/esm/types/index.d.ts",
    output: [{ file: "dist/index.d.ts", format: "esm" }],
    plugins: [dts()],
    external: [/\.(css|less|scss)$/],
  },
];