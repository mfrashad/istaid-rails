class Admin::DashboardsController < Admin::BaseController
  def index
    @dashboards = [
      {
        title: 'Artikel',
        url: admin_posts_path,
      },
      {
        title: 'Staff',
        url: admin_employees_path,
      },
      {
        title: 'Galeri',
        url: admin_galleries_path,
      },
      {
        title: 'Komentar',
        url: admin_comments_path,
      },
      {
        title: 'Kategori',
        url: admin_categories_path,
      },
    ]
  end
end
