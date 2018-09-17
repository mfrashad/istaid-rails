class Admin::DashboardsController < Admin::BaseController
  def index
    @dashboards = [
      {
        title: 'Buletin',
        url: admin_posts_path,
      },
      {
        title: 'Kegiatan',
        url: admin_events_path,
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
      {
        title: 'Pages',
        url: admin_static_pages_path,
      }
    ]
  end
end
