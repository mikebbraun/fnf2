# README

Medium: Photogur Project

This project will create a clone of Imgur called Photogur. It allows users to re-post images they find online.

Let’s start a new app.

$ rails new photogur
$ cd photogur
We want an app to manage Pictures, so let’s generate a scaffold for it and migrate.

$ rails g scaffold Picture title url --javascript-engine=js --stylesheet-engine=css
$ rake db:migrate
When we run the server, we get the scaffold we expect at http://localhost:3000/pictures. Let’s create a picture with a URL:

image alt text

I used Chrome Developer tools to grab the URL to the Wyncode logo from the Wyncode site. But there’s a problem.

image alt text

When I display the picture, I see the URL rather than the image. I need to use an image tag in the show view. So let’s fix that.

# In app/views/pictures/show.html.erb

<p id="notice"><%= notice %></p>
<p>
  <strong>Title:</strong>
  <%= @picture.title %>
</p>
<p>
  <%= image_tag @picture.url %>
</p>

<%= link_to 'Edit', edit_picture_path(@picture) %> |
<%= link_to 'Back', pictures_path %>
My edits (in bold) removed the URL header and replaced the URL text with an image_tag. The image_tag method is a "view helper", a method that helps you generate HTML code. You could have accomplished the same thing using this line of code instead:

<img src="<%= @picture.url %>">
But, in this case, the result is slightly more code for slightly less HTML. The image_tag helper produces this HTML:

<img alt="Logo wyncode1" src="http://wyncode.co/wp-content/uploads/2014/02/logo-wyncode1.png" />
While writing HTML manually produces this:

<img src="[http://wyncode.co/wp-content/uploads/2014/02/logo-wyncode1.png](http://wyncode.co/wp-content/uploads/2014/02/logo-wyncode1.png)">
Letting Rails handle HTML-generation allows Rails to, for example, add an alt attribute to make your page more accessible. If more accessibility tags are recommended in the future (e.g. https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA), Rails will automatically add them for you if you use their helpers. Otherwise you have to do it yourself. So using the view helpers is recommended.

With this change to the show view, our Picture page looks better.

image alt text

But the index page is still showing text URLs.

image alt text

So we need to update the index view as well.

 # In app/views/pictures/index.html.erb

<h1>Listing pictures</h1>
<table>
  <thead>
    <tr>
      <th>Title</th>
      <th>Url</th>
      <th colspan="3"></th>
    </tr>
  </thead>

  <tbody>
    <% @pictures.each do |picture| %>
      <tr>
        <td><%= picture.title %></td>
        <td><%= image_tag picture.url %></td>
        <td><%= link_to 'Show', picture %></td>
        <td><%= link_to 'Edit', edit_picture_path(picture) %></td>
        <td><%= link_to 'Destroy', picture, method: :delete, data: { confirm: 'Are you sure?' } %></td>
      </tr>
    <% end %>
  </tbody>
</table>

<br>
<%= link_to 'New Picture', new_picture_path %>
My edit (in bold) changes the text URL to an image_tag. Now my Picture list is working.

image alt text

And that’s all you need to create your own photo hosting site. Obviously we’re cheating a bit here because we’re not allowing users to upload their own photos. We’re just displaying photos uploaded elsewhere. But this app gives you a great platform for coming up with some fancy designs or jQuery picture viewing effects. So have fun with it.
