# PhoenixTailwindTurbolinksSkeleton

This is a simple Phoenix skeleton showing how you can add Tailwind (with PurgeCSS) and Turbolinks to your application.

The commits have information on what to run and what files to add/change for each step but I'll list them next as well.

## Tailwind CSS + PurgeCSS

```
npm install --save-dev tailwindcss \
                       postcss-loader \
                       postcss-import \
                       @fullhuman/postcss-purgecss

# This next step is optional if you don't need to configure Tailwind
# Generate assets/tailwind.config.js
npx tailwindcss init
```

Replace `assets/css/app.css` with:
```
/* purgecss start ignore */
@tailwind base;
@tailwind components;
/* purgecss end ignore */

@tailwind utilities;
```

Create `assets/postcss.config.js` with the following contents:
```
const purgecss = require('@fullhuman/postcss-purgecss')({
  content: [
    "../**/*.html.eex",
    "../**/*.html.leex",
    "../**/views/**/*.ex",
    "../**/live/**/*.ex",
    "./js/**/*.js"
  ],
  defaultExtractor: content => content.match(/[\w-/:]+(?<!:)/g) || []
})

module.exports = {
  plugins: [
    require("postcss-import"),
    require("tailwindcss"),
    require("autoprefixer"),
    ...(process.env.NODE_ENV === "production" ? [purgecss] : [])
  ]
};
```

Add `'postcss-loader'` to the `assets/webpack.config.js` css rule. In Phoenix 1.4 just change

```
{
  test: /\.css$/,
  use: [MiniCssExtractPlugin.loader, 'css-loader']
}
```

to

```
{
  test: /\.css$/,
  use: [MiniCssExtractPlugin.loader, 'css-loader', 'postcss-loader']
}
```

## Turbolinks

Run `npm install turbolinks` and add the following lines to `assets/js/app.js`:
```
# At the top of the file
import Turbolinks from "turbolinks";

# At the bottom of the file
Turbolinks.start();
```

Copy [`lib/phoenix_tailwind_turbolinks_skeleton_web/plugs/turbolinks.ex`](lib/phoenix_tailwind_turbolinks_skeleton_web/plugs/turbolinks.ex) to your app, don't forget to rename the module to the one your app uses.

## Inter font

Add `<link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet">` to your layout(s).

Update your `assets/tailwind.config.js` to extend the font family:
```
const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  variants: {},
  plugins: [],
}
```